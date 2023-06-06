// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flap14/hakkinda-felsefeonemi.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../cloud_services/cloud_storage_constants.dart';
import '../main.dart';

class UserCloudAuthView extends StatelessWidget {
  const UserCloudAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      // final bool debugShowCheckedModeBanner: false;

      // debugShowCheckedModeBanner: false,
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Hakkinda()));
          },
        ),
      ),
      body: Center(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SignInScreen(
                providerConfigs: const [
                  EmailProviderConfiguration(),
                  GoogleProviderConfiguration(
                      clientId:
                          '963656261848-v7r3vq1v6haupv0l1mdrmsf56ktnua60.apps.googleusercontent.com'),
                ],
                headerBuilder: ((context, constraints, shrinkOffset) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: AspectRatio(
                      aspectRatio: 2,
/*
                      child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/05/19/09/32/checklist-1402461_960_720.png'),
                          */
                    ),
                  );
                }),
                subtitleBuilder: (context, action) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: action == AuthAction.signIn
                        ? const Text('Hoş geldiniz, giriş yapınız')
                        : const Text(
                            'Welcome to My Listbuddy, please sign up!'),
                  );
                },
                footerBuilder: ((context, action) {
                  return Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      //'44',
                      // 'By Signing in, you agree to our terms and conditions.',
                      'Oturum açarak, şartlar ve koşullarımızı kabul etmiş olursunuz.',
                      // style: TextStyle(color: Colors.grey),
                    ),
                  );
                }),
                sideBuilder: (context, shrinkOffset) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: AspectRatio(
                      aspectRatio: 2,
                      /*
                      child: Image.network(
                          'https://cdn.pixabay.com/photo/2016/05/19/09/32/checklist-1402461_960_720.png'),
                   */
                    ),
                  );
                },
              );
            }

            return MyHomePage(
              title: 'Üyeler',
              listId: 'listId',
              documentId: documentId,
            );
          },
        ),
      ),
    );
  }
}
