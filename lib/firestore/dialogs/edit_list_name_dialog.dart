// ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_list_item_dialog.dart';

TextEditingController textFieldController = TextEditingController();
final currentUser = FirebaseAuth.instance.currentUser!;

Future ShowEditListNameDialog(BuildContext context, String documentId) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit List Name'),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(hintText: "Enter New List Name"),
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
            onPressed: () {
              final listName = textFieldController.text;

              cloudStorage.upDateListName(
                listName: listName,
                documentId: documentId,
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
