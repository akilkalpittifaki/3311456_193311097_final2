import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class Ziyapasa extends StatefulWidget {
  //const Hakkinda({super.key});

  @override
  State<Ziyapasa> createState() => _ZiyapasaState();
}

class _ZiyapasaState extends State<Ziyapasa> {
  //bu kismi felsefe onemi yaptik sonradan
  //final GoogleAds _googleAds = GoogleAds(); //olusturdugumuz clastan bir sinif olusturabiliriz.  locator kullanmıyorsan.

  @override
  Widget build(BuildContext context) {
    //return Column(
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 230, 225),
        appBar: AppBar(
          title: const Text('Ziya Paşa'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ziyapasa.jpg"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Ya bir işe önceden başlama, Yahut da başladığın işi bitir, yarıda bırakma! -ZİYA PAŞA",
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
