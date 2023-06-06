import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class Yaziindir extends StatefulWidget {
  Yaziindir() : super();

  final String title = "Yazi Dosyasi";

  @override
  _YaziindirState createState() => _YaziindirState();
}

class _YaziindirState extends State<Yaziindir> {
  //String fileContents = "Veri Yok";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: myController,
            ),
          ),
          Image.network(
            'https://i.pinimg.com/originals/80/be/6c/80be6ce0ce1732f5a6e9b920b8c841a8.jpg',
            height: 800,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            child: const Text('Bu yaziyi indir'),
            onPressed: () async {
              var dio = Dio();
              Directory directory = await getApplicationDocumentsDirectory();
              var response = await dio.download(
                  "https://products.groupdocs.app/viewer/app?lang=en&file=04d35522-f6b1-46ec-9139-f25940606977/yunusemre.txt",
                  // "https://filesamples.com/samples/document/txt/sample1.txt",
                  '${directory.path}/yunus.txt');
              print(response.statusCode);
            },
          ),
        ],
      ),
    );
  }
}


/*
void downloadFile() async {
  var dio = Dio();
  Directory directory = await getApplicationDocumentsDirectory();
  var response = await dio.download(
      "https://filesamples.com/samples/document/txt/sample1.txt",
      '${directory.path}/file88.txt');
  print(response.statusCode);
}

*/