// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../cloud_services/cloud_storage_constants.dart';
import '../cloud_services/firestore_cloud_storage.dart';
import '../data/models/cloud_list_name.dart';
import '../widgets/mobile_list_name_view.dart';
import '../widgets/navigation_drawer.dart';

class MobileLayout extends StatefulWidget {
  final String title;
  final String listId;

  const MobileLayout({
    Key? key,
    required this.title,
    required this.listId,
  }) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  var cloudStorage = FireStoreCloudStorage();

  @override
  void initState() {
    cloudStorage = FireStoreCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MobileNavigationDrawer(),
      body: StreamBuilder(
        stream: cloudStorage.getListName(
          textFieldListName: textFieldListName,
          ownerUserId: cloudStorage.currentUser.uid,
        ),
        builder: (context, snapshot) {
          debugShowCheckedModeBanner:
          false;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              if (snapshot.hasData) {
                var allListNames = snapshot.data as Iterable<CloudListName>;
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: allListNames.length,
                  itemBuilder: (context, index) {
                    final CloudListName snapshot =
                        allListNames.elementAt(index);
                    return MobileListNameView(
                      listName: snapshot.listName,
                      documentId: snapshot.documentId,
                      listId: snapshot.documentId,
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
