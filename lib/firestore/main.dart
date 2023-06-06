// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flap14/firestore/screens/mobile_layout.dart';
import 'package:flap14/firestore/screens/user_cloud_auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:provider/provider.dart';
import '../firebase_options.dart';
import 'cloud_services/cloud_storage_constants.dart';
import 'cloud_services/firestore_cloud_storage.dart';
import 'data/models/cloud_list_item.dart';
import 'screens/desktop_layout.dart';

const clientId = 'YOUR_CLIENT_ID';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterFireUIAuth.configureProviders([
    // const EmailProviderConfiguration(),
    const GoogleProviderConfiguration(clientId: clientId)
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FireStoreCloudStorage>(
            create: (_) => FireStoreCloudStorage(),
          ),
          ChangeNotifierProvider<CloudListItem>(
              create: (_) => CloudListItem(
                    documentId: documentId,
                    listId: 'listId',
                    listItem: 'list_item',
                  )),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            'home': (context) => const DesktopLayout(
                  title: 'ListBuddy',
                  crossAxisCount: 5,
                  listName: '',
                ),
          },
          title: 'ListBuddy',
/*
          theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
                      .copyWith(secondary: Colors.black)
                      ),
                      */
          home: const UserCloudAuthView(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.title,
      required this.listId,
      required this.documentId});
  final String title;
  final String listId;
  final String documentId;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return LayoutBuilder(builder: (ctx, constraints) {
      debugShowCheckedModeBanner:
      false;
      if (constraints.maxWidth < 600) {
        return MobileLayout(
          title: widget.title,
          listId: widget.listId,
        );
      }
      int crossAxisCount = 0;
      if (constraints.maxWidth > 1400) {
        crossAxisCount = 4;
      } else if (constraints.maxWidth > 800) {
        crossAxisCount = 3;
      } else if (constraints.maxWidth >= 600) {
        crossAxisCount = 2;
      }
      return DesktopLayout(
        debugShowCheckedModeBanner: false,
        title: widget.title,
        crossAxisCount: crossAxisCount,
        listName: '',
      );
    });
  }
}
