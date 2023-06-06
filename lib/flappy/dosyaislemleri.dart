import 'package:flap14/flappy/baskaresim.dart';
import 'package:flap14/flappy/videoindir.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class FileOperationsScreen extends StatefulWidget {
  FileOperationsScreen() : super();

  final String title = "Resim İndir";

  @override
  _FileOperationsScreenState createState() => _FileOperationsScreenState();
}

class _FileOperationsScreenState extends State<FileOperationsScreen> {
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
            'https://www.camhotel.com.tr/uploads/ulkemizin-dort-bir-yanindan-guzel-manzara-fotograflari.jpg',
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            child: const Text('Download'),
            onPressed: () async {
              String url =
                  'https://www.camhotel.com.tr/uploads/ulkemizin-dort-bir-yanindan-guzel-manzara-fotograflari.jpg';
              await GallerySaver.saveImage(url, toDcim: true);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                      MaterialPageRoute(builder: (context) => Yaziindir()));
                },
                child: const Text('Özlü Söz İndir)')),
          ),

          Padding(
            padding: const EdgeInsets.all(14.0),
            //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                      MaterialPageRoute(builder: (context) => mp4()));
                },
                child: const Text('Freud MP4 ve PDF indir')),
          ),

          // Text(fileContents),
        ],
      ),
    );
  }
}
