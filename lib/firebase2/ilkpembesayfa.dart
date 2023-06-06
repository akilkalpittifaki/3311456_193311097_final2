import 'package:flutter/material.dart';

import 'login_screen2.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoşgeldiniz"),
      ),
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(children: [
          const SizedBox(height: 150),
          const Icon(
            //ikon burada o beyaz şekil
            Icons.feed,
            size: 120,
            color: Colors.white,
          ),
          const SizedBox(height: 48),
          /*
          const Text(
            "Hoş geldiniz !",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          */
          const SizedBox(height: 12),
          const Text(
            "Uygulamamıza üye olan felsefe severler kaydedilmektedir ve bu uygulama üyeliğini referans olarak her yerde gösterebilirler.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(height: 72),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen2(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              foregroundColor: const MaterialStatePropertyAll(Colors.pink),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            child: const Text(
              "Kayıt Ol ve Giriş Yap",
            ),
          )
        ]),
      ),
    );
  }
}
