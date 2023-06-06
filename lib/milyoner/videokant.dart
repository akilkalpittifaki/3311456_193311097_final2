import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../hakkinda-felsefeonemi.dart';

class Videokant extends Hakkinda {
// const Videokant({super.key});

  // const Video({super.key}); //sonradan

  @override
  State<Videokant> createState() => _VideokantState();
}

class _VideokantState extends State<Videokant> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.asset('videos/kant.mp4');
    //await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: () => debugPrint('Option 1 pressed!'),
            iconData: Icons.chat,
            title: 'Option 1',
          ),
          OptionItem(
            onTap: () => debugPrint('Option 2 pressed!'),
            iconData: Icons.share,
            title: 'Option 2',
          ),
        ];
      },
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kant İyi Yaşam Ses"),
      ),
      body: chewieController != null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Chewie(
                controller: chewieController!,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
