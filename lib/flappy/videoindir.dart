import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class mp4 extends StatefulWidget {
  final String title = "Freud PDF ve video indir";
  @override
  _mp4State createState() => _mp4State();
}

class _mp4State extends State<mp4> {
  String _filePath = "";

  Future<String> get _localDevicePath async {
    final _devicePath = await getApplicationDocumentsDirectory();
    return _devicePath.path;
  }

  Future<File> _localFile({required String path, required String type}) async {
    String _path = await _localDevicePath;

    var _newPath = await Directory("$_path/$path").create();
    return File("${_newPath.path}/hamit.$type");
  }

  Future _downloadSamplePDF() async {
    final _response = await http.get(Uri.parse(
        "https://drive.google.com/file/d/1hlXW4-R5Iwca8NGurPbgJXy-C3fpe85o/view?usp=sharing"));
    if (_response.statusCode == 200) {
      final _file = await _localFile(path: "pdfs", type: "pdf");
      final _saveFile = await _file.writeAsBytes(_response.bodyBytes);
      print("Dosya yazma işlemi tamamlandı. Dosyanın yolu: ${_saveFile.path}");
      setState(() {
        _filePath = _saveFile.path;
      });
    } else {
      print(_response.statusCode);
    }
  }

  Future _downloadSampleVideo() async {
    final _response = await http.get(Uri.parse(
        "https://drive.google.com/file/d/1SiLSn1MyUphawg2vhgIVWYkRXW722qns/view"));
    // .get(Uri.parse("https://samplelib.com/lib/download/mp4/sample-5s.mp4"));
    if (_response.statusCode == 200) {
      final _file = await _localFile(
        path: "mp4s",
        type: "mp4",
      );
      final _saveFile = await _file.writeAsBytes(_response.bodyBytes);
      print("Dosya yazma işlemi tamamlandı. Dosyanın yolu: ${_saveFile.path}");
      setState(() {
        _filePath = _saveFile.path;
      });
    } else {
      print(_response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        // child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://t3.ftcdn.net/jpg/01/95/99/64/360_F_195996465_tp0brO4XnEOgKnTuGI552iNxQb29QwS9.jpg',
            height: 800,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          TextButton.icon(
            icon: Icon(Icons.file_download),
            label:
                Center(child: Text("Freud Mutluluk Dediğimiz Şey PDF indir")),
            onPressed: () {
              _downloadSamplePDF();
            },
          ),
          TextButton.icon(
            icon: Icon(Icons.file_download),
            label: Center(child: Text("Freud Kimdir Video İndir")),
            onPressed: () {
              _downloadSampleVideo();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_filePath),
          ),
          TextButton.icon(
            icon: Icon(Icons.tv),
            label: Center(child: Text("İndirilen Dosyanin konumunu Göster")),
            onPressed: () async {
              final _openFile = await OpenFilex.open(_filePath);
              print(_openFile);
            },
          ),
        ],
      ),
    );
  }
}
