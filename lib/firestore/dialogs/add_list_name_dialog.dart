import 'package:flutter/material.dart';

import '../cloud_services/firestore_cloud_storage.dart';

TextEditingController textFieldController = TextEditingController();
var cloudStorage = FireStoreCloudStorage();

Future<void> ShowAddListDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('List Name'),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(hintText: "Enter List Name"),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
              textFieldController.clear();
            },
          ),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () async {
              final String listName = textFieldController.text;
              cloudStorage.createNewList(
                ownerUserId: cloudStorage.currentUser.uid,
                listName: listName,
              );

              Navigator.pop(context);
              textFieldController.clear();
            },
          ),
        ],
      );
    },
  );
}
