import 'package:flap14/flappy/apiislem2/main.dart';
import 'package:flap14/firebase2/ilkpembesayfa.dart';
import 'package:flap14/flappy/grafik/maingrafik.dart';
import 'package:flap14/flappy/mainsql.dart';
import 'package:flap14/milyoner/videokant.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'firestore/main.dart';
import 'flappy/apiislemleri.dart';
import 'flappy/dosyaislemleri.dart';
import 'milyoner/basgaza-internet.dart';
import 'milyoner/birsorupinokyo.dart';
import 'milyoner/cevapanahtari.dart';
import 'milyoner/galery_page.dart';
import 'milyoner/gruplandirilmis.dart';

class Hakkinda extends StatefulWidget {
  //const Hakkinda({super.key});

  @override
  State<Hakkinda> createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  String _filePath = "";
  //bu kismi felsefe onemi yaptik sonradan
  //final GoogleAds _googleAds = GoogleAds(); //olusturdugumuz clastan bir sinif olusturabiliriz.  locator kullanmıyorsan.

  @override
  Widget build(BuildContext context) {
    //return Column(
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 224, 230, 225),
        appBar: AppBar(
          title: const Text('Koridor'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*
              Image(
                  image: ResizeImage(AssetImage('assets/images/filomini.jpg'),
                      width: 100, height: 150)),
                      */
              Image.asset("assets/images/filomini.jpg"),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                        MaterialPageRoute(builder: (context) => Cevaplar()));
                  },
                  child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: const Text(
                      'Cevap Anahtarı',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(builder: (context) => Videokant()));
                    },
                    child: const Text('Kant İyi Yaşam Video')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(
                              builder: (context) => GalleryPage()));
                    },
                    child: const Text('Filozoflar Fotoğraf Galeri')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(
                              builder: (context) => const Gruplandirilmis()));
                    },
                    child: const Text('Gruplandırılmış Filozoflar Listesi')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(
                              builder: (context) => const Birsorupinokyo()));
                    },
                    child: const Text('Bir Soru')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(
                              builder: (context) => const Basgazameraketmek()));
                    },
                    child: const Text('Merak Etmek ? (Gestures)')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(
                              builder: (context) => FileOperationsScreen()));
                    },
                    child: const Text('İndir (Dosya İslemleri)')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(
                              builder: (context) => MyAppApi11()));
                    },
                    child: const Text('Uygulamaya üye olanlar (API)')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(
                              builder: (context) => MyAppApi11()));
                    },
                    child: const Text('Sql islemleri')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(
                              builder: (context) => SplashScreen2()));
                    },
                    child: const Text('Üye Ol /Firebase')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                //  child: ElevatedButton(onPressed: null, child: Text('Felsefeye dön')),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: const Text('Vip Üyelik /FireStore')),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                          MaterialPageRoute(builder: (context) => Grafik()));
                    },
                    child: const Text('Grafik')),
              ),
            ],
          ), //Column widgettir kolon demek. Alt öğelerini dikey bir dizide görüntüleyen bir pencere öğesi.
        )
        //iskele scaffold, Temel Materyal Tasarımı görsel yerleşim yapısını uygular.
        );
  }
}
