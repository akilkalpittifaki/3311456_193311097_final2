import 'package:flutter/material.dart';

class Yasarkemal2 extends StatefulWidget {
  //const Hakkinda({super.key});

  @override
  State<Yasarkemal2> createState() => _Yasarkemal2State();
}

class _Yasarkemal2State extends State<Yasarkemal2> {
  @override
  Widget build(BuildContext context) {
    //return Column(
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 230, 225),
        appBar: AppBar(
          title: const Text('Yasar Kemal'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/yasarkemal.jpg"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Dağlar, insanlar ve hatta ölüm bile yorulduysa, şimdi en güzel şiir: barıştır.-Yasar Kemal",
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
