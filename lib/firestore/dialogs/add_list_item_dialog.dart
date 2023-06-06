import 'package:flutter/material.dart';

import '../cloud_services/firestore_cloud_storage.dart';

var cloudStorage = FireStoreCloudStorage();
TextEditingController textFieldController = TextEditingController();

Future<void> displayAddItemDialog(BuildContext context, String listId) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('New Item'),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(hintText: "Enter New Item"),
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
              final String listItem = textFieldController.text;

              cloudStorage.createNewListItem(
                ownerUserId: cloudStorage.currentUser.uid,
                listId: listId,
                listItem: listItem,
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
