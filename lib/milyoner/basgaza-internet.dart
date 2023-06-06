// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../flappy/adamsmith.dart';
import '../flappy/schiller.dart';
import '../flappy/yasarkemal.dart';
import '../flappy/ziyapasa.dart';
import 'cevapanahtari.dart';

class Basgazameraketmek extends StatefulWidget {
  const Basgazameraketmek({Key? key}) : super(key: key);

  @override
  State<Basgazameraketmek> createState() => _BasgazameraketmekState();
}

class _BasgazameraketmekState extends State<Basgazameraketmek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bas gaza"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.8,
              center: Text(
                "80.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // footer: Text("Sales this week", style: TextStyle(fontSize: 14),),
              circularStrokeCap: CircularStrokeCap.square,
              progressColor: Colors.redAccent,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.90,
                center: Text("90.0%"),
                // linearStrokeCap: LinearStrokeCap.roundAll,
                barRadius: Radius.circular(15),
                progressColor: Colors.redAccent,
              ),
            ),
            Container(
              color: Colors.green,
              child: GestureDetector(
                child: GestureDetector(
                  child: Text(
                    'Sakin basma',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      'Hayata doymak bilmez bir merakla yaklaş ve kesintisiz öğrenmek için sürekli arayış içinde ol. Leonardo Da Vinci',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )));
                  },
                ),
              ),
            ),
            GestureDetector(
              child: GestureDetector(
                child: Text(
                  '\nSakin 2 kez basma',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onDoubleTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'Felsefe kişilerin yaşamı merak etmesinden doğar.Yaşamı en çok merak eden çocuklardır -Aristoteles',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )));
                },
              ),
            ),
            GestureDetector(
              child: GestureDetector(
                child: Text(
                  '\nSakin basili tutma',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                onLongPress: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'Merak,bütün şaheserlerin doğumunu hazırlayan ilk sancıdır.Oyhan Hasan Bildirki',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )));
                },
              ),
            ),
            GestureDetector(
              child: Container(
                width: 450,
                height: 200,
                alignment: Alignment.center,
                color: Color.fromARGB(255, 6, 103, 9),
                child: Text(
                  '\nKırmızı hapı seçmek istiyorsan saga, mavi hap icin sola kaydir ?\n',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              /*
              child: Text(
                '\nKırmızı hapı seçmek istiyorsan saga, mavi hap icin sola kaydir ?\n',
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
              */
              onPanUpdate: (details) {
                // Swiping in right direction.
                if (details.delta.dx > 0) {
                  Navigator.push(
                      context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                      MaterialPageRoute(builder: (context) => Adam()));
                }

                // Swiping in left direction.
                if (details.delta.dx < 0) {
                  Navigator.push(
                      context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                      MaterialPageRoute(builder: (context) => Yasarkemal2()));
                }
              },
            ),
            GestureDetector(
              onVerticalDragUpdate: (details) {
                int sensitivity = 4;
                if (details.delta.dy > sensitivity) {
                  Navigator.push(
                      context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                      MaterialPageRoute(builder: (context) => Ziyapasa()));
                } else if (details.delta.dy < -sensitivity) {
                  Navigator.push(
                      context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                      MaterialPageRoute(builder: (context) => Schiller()));
                }
              },
              child: Container(
                width: 450,
                height: 200,
                alignment: Alignment.center,
                color: Colors.green,
                child: Text(
                  'Aşağı tükürsen sakal, yukarı tükürsen bıyık !',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
