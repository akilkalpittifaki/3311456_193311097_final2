// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, duplicate_ignore

//import 'dart:math';

import 'package:flap14/milyoner/soruhavuzu.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

//import 'package:quiz/soru.dart';

//import 'soru.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../homepage.dart';
import '../hakkinda-felsefeonemi.dart'; //bu kütüphaneyi bitiş widgeti için, en sondaki ekran için indirdik. pub.dev den
//import 'package:flutter_lints/flutter.yaml';
//import 'package:flutter_test/flutter_test.dart';

//import 'package:rflutter_alert/rflutter_alert.dart';
//soru ile isimiz kalmadıgı icin soru.dart importunu kaldırabiliriz

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  // const Quiz({super.key}); //sonradan
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //bunla debug yazisi gitti

        home: Scaffold(
            appBar: AppBar(
                title: Text("Ana Sayfa")), //üstte yazıcak seyı olusturuyor
            /*Scaffold Widget, Flutter uygulamasının temel ‘Material’ dizayn yapısını uygulayan bir çerçevedir*/
            backgroundColor: Color.fromARGB(255, 71, 17, 179),
            body: SafeArea(

                //İşletim sisteminin izinsiz girişlerini önlemek için alt öğesini yeterli dolguyla ekleyen bir pencere öğesi.
                child: Padding(
              //dolgu malzemesi
              padding:
                  EdgeInsets.symmetric(horizontal: 10.0), //horizontal yatay

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Quizpage(), //sonradan sildik
              ),
            ))));
  }
}

class Quizpage extends StatefulWidget {
  // const Quizpage({super.key, required this.title}); //sonradan
  //final String title; //sonradan

  //const Quizpage({super.key});
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> sonucList = [];
  //dogruya basınca da yanlısa basınca da iki tane fonksiyon var ikisi de benzer. tek bir fonksiyon yapmayı hedefleyelim.
  void soruCevapla(bool kullaniciCevap) {
    setState(() {
      //   if (soruIndex == 2) soruIndex = 1; son soruyu yapınca error vermesını engellemeye calıstık ama olmadı devam yapmaya.
      bool dogruCevap = soruHavuzu.soruCevapGetir();
      if (soruHavuzu.sorularBittiMi() == true) {
        //sorular bitti mi ogrenmeye calısıyoz
        //soru havuzu sayfasından hatırla, sorular bittimi fonksiyonu nasıldı, eğer soru index büyük eşit soru bankası.lengt-1 ise true dönmüş demek.
        //true döndüğü anda asagıdaki if else bloğunu kestik, yeni ife yani buraya attık.
        if (dogruCevap == kullaniciCevap) {
          //kullanicinin bastigi cevabı seciyoz. soru havuzundakiyle aynıysa tik değilse çarpı göstercek uygulama.
          dogruCevapSayisi++; // check geldiyse yani çarpı gelmediyse dogru cevap sayisini bir arttiriyoruz.
          sonucList.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          sonucList.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        // if else den sonra sorular bittigi icin quizbitir metodu cagırıcaz
        quizBitir();
      } else {
        //else demektir ki sorular daha bitmedi.
        if (dogruCevap == kullaniciCevap) {
          //kullanicinin bastigi cevabı seciyoz. soru havuzundakiyle aynıysa tik değilse çarpı göstercek uygulama.
          dogruCevapSayisi++; // check geldiyse yani çarpı gelmediyse dogru cevap sayisini bir arttiriyoruz.
          sonucList.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          sonucList.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        soruHavuzu.sonrakiSoruGetir();
      }

      // soruIndex++; //her bastikca diger soruya gecicek //ama soruhavuzu ekleyınce bu hükümsüz oldu
    });
  }

  //dogru cevap sayisini tutalim cunku dogru cevap sayisiyla birlikte kullanıciya biz kaç soruyu cevapladıgını gosterecez.
  //alert uyarı demek Displays a modal alert to the user. Kullaniciya kalici bir uyarı goruntuler

  int dogruCevapSayisi = 0;
  void quizBitir() {
    Alert(
        context: context,
        type: AlertType.info,
        title: "Felsefe testi tamamlandi",
        desc: "Doğru Sayisi $dogruCevapSayisi", //Alert widgetinin adi desc dir.
        //descriptionu da olusturduk artık butnlari olusturabiliriz.
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(
                context), //burada navigasyon kullandik //başa dönmek için. !!!!
            //onpressed aninda yapacagım sey sayfaya tekrar donmek.
            //onPressed ile kullanıcı tarafından ilgili butona bastığında çalışacak bir işleve yönlendirmeyi ifade edilir.
            width: 120, //width genislik
            //uygulama ile değişen değişkenlerimiz var, listelerimiz var. bunları da resetlememiz lazım şimdi.
            //soru havuzunu nası resetliyosak soru listesini de resetlememiz lazım yani.
            child: Text(
              "Tamam",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
    //AlertDialog genellikle uygulamadan çıkmaya çalıştığınızda, uygulamadan çıkmaya emin misiniz şeklinde karşımıza çıkan uyarı kutucuğudur.
    soruHavuzu.reset();
    sonucList = [];
    dogruCevapSayisi = 0;
  }

  //soruhavuzunu kullanarak bir nesne üretecez ve soru havuzu içindeki fonksiyonları main içinde kullanacaz.
  SoruHavuzu soruHavuzu =
      SoruHavuzu(); //nesneyi ürettim artik icindeki fonksiyonları kullanabilirim
  // List<bool> cevaplar = [true, false, true];

  //int soruIndex = 0; //simdi bi soruyu cevaplayınca diger soruya gecme islemini yapacagim
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0), //her yerden 10 birim yaptık bu kez
            child: Center(
              child: Text(
                //  soruBankasi[soruIndex].soruText, //ilk sorudan basladi
                soruHavuzu
                    .soruTextGetir(), // bu fonksiyonla nesnemizi getirmiş olduk
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: TextButton(
              // textColor: Colors.white,
              //color: Colors.lightGreen,
              //  child: Container(
              //decoration: BoxDecoration( color: Colors.green ),
              //            )

              /*  child: Row(
                children: [
                  Text(
                    'dogru',
                    style: TextStyle(color: Colors.white),
           ),
                  Icon(Icons.chevron_right_sharp, color: Colors.green),
                ],
              ),*/
              onPressed: () {
                soruCevapla(true); //dogru cevap verdigi icin true yi gonderıyom
                //dogru secim icin
              },
              style: ButtonStyle(
                // color: Colors.white, fontSize: 20.0
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'dogru',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: TextButton(
              // textColor: Colors.white,
              //color: Colors.lightGreen,

              onPressed: () {
                soruCevapla(false);
              },
              //child: Color(Colors.black),
              style: ButtonStyle(
                  // color: Colors.white, fontSize: 20.0
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'yanlis',
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ),
        ),
        Row(
          children: sonucList,
        ),
        Padding(
          //padding ile konumlandiriyoruz.
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                    MaterialPageRoute(builder: (context) => Hakkinda()));
              },
              child: Text('Felsefe Önemi')),
        ),
        Padding(
          //padding ile konumlandiriyoruz.
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, //burada da bir navigasyon yani sayfalar arasi gecis kullandik
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Russell Bird')),
        ),
      ],
    );
  }
}
