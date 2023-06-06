import 'package:flutter/material.dart';

class Schiller extends StatefulWidget {
  //const Hakkinda({super.key});

  @override
  State<Schiller> createState() => _SchillerState();
}

class _SchillerState extends State<Schiller> {
  @override
  Widget build(BuildContext context) {
    //return Column(
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 230, 225),
        appBar: AppBar(
          title: const Text('Schiller'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/schiller.jpg"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Yükselmenin en alçakçası, zayıfların sırtına basarak yükselmektir. -Friedrich Schiller",
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ],
          ), //Column widgettir kolon demek. Alt öğelerini dikey bir dizide görüntüleyen bir pencere öğesi.
        )
        //iskele scaffold, Temel Materyal Tasarımı görsel yerleşim yapısını uygular.
        );
  }
}
