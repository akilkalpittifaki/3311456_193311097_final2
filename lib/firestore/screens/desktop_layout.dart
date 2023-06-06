import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../cloud_services/firestore_cloud_storage.dart';
import '../data/models/cloud_list_name.dart';
import '../dialogs/add_list_name_dialog.dart';
import '../widgets/list_name_view.dart';

class DesktopLayout extends StatefulWidget {
  final String title;
  final String listName;
  final int crossAxisCount;

  const DesktopLayout({
    debugShowCheckedModeBanner: false,
    Key? key,
    required this.title,
    required this.crossAxisCount,
    required this.listName,
  }) : super(key: key);

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  var cloudStorage = FireStoreCloudStorage();

  @override
  void initState() {
    cloudStorage = FireStoreCloudStorage();
    super.initState();
  }

  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    Widget getAction(String actionName) {
      return TextButton(
        onPressed: () {
          if (actionName == 'Add List') {
            ShowAddListDialog(context);
          } else if (actionName == 'Profile') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(
                  appBar: AppBar(
                    title: Text(currentUser.email!),
                  ),
                ),
              ),
            );
          } else if (actionName == 'Log Out') {
            FirebaseAuth.instance.signOut();
          }
        },
        child: Text(
          actionName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getAction('Profile'),
                getAction('Add List'),
                getAction('Log Out')
              ],
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: cloudStorage.getListName(
          ownerUserId: currentUser.uid,
          textFieldListName: '',
        ),
        builder: (context, snapshot) {
          debugShowCheckedModeBanner:
          false;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                var allListNames = snapshot.data as Iterable<CloudListName>;
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: allListNames.length,
                  itemBuilder: (context, index) {
                    final CloudListName snapshot =
                        allListNames.elementAt(index);
                    return ListNameView(
                      listName: snapshot.listName,
                      documentId: snapshot.documentId,
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
