import 'package:flutter/material.dart';

class Adam extends StatefulWidget {
  //const Hakkinda({super.key});

  @override
  State<Adam> createState() => _AdamState();
}

class _AdamState extends State<Adam> {
  @override
  Widget build(BuildContext context) {
    //return Column(
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 230, 225),
        appBar: AppBar(
          title: const Text('Adam Smith'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/adam.jpg"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Her birey kendi kârını arttırmaya çalışırken amacı hiç de bu olmadığı halde bütün toplumun zenginliğinin artmasına hizmet eder. Bunu yaptıran piyasanın gizli elidir.-Adam Smith",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ), //Column widgettir kolon demek. Alt öğelerini dikey bir dizide görüntüleyen bir pencere öğesi.
        )
        //iskele scaffold, Temel Materyal Tasarımı görsel yerleşim yapısını uygular.
        );
  }
}
