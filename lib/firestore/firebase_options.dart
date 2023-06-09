// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCO6TR8BMkIaZzCSLPbjMhtmH-uGX8r3-M',
    appId: '1:791441578666:web:c768a9f9e37eee95ab0ed3',
    messagingSenderId: '791441578666',
    projectId: 'listbuddyweb',
    authDomain: 'listbuddyweb.firebaseapp.com',
    storageBucket: 'listbuddyweb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWxC1L1YnGoH1t1y4TOOMh0HgDHNI8PoI',
    appId: '1:791441578666:android:82f2008b8cd62eddab0ed3',
    messagingSenderId: '791441578666',
    projectId: 'listbuddyweb',
    storageBucket: 'listbuddyweb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYNVA3CU936ZCuzmjb3TZEuf4Zoq3zbzQ',
    appId: '1:791441578666:ios:fc1f2ec633d2d4b4ab0ed3',
    messagingSenderId: '791441578666',
    projectId: 'listbuddyweb',
    storageBucket: 'listbuddyweb.appspot.com',
    iosClientId: '791441578666-l0o3ipsir05ue27bfrjsofm43p5l18lp.apps.googleusercontent.com',
    iosBundleId: 'com.example.listbuddy',
  );
}
