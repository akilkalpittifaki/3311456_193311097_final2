// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_list_item_dialog.dart';

TextEditingController textFieldController = TextEditingController();
final currentUser = FirebaseAuth.instance.currentUser!;

Future<void> ShowEditItemNameDialog(
    BuildContext context, String documentId, String listId) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit Item Name'),
        content: TextField(
          controller: textFieldController,
          decoration: const InputDecoration(hintText: "Enter New Item Name"),
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
              final itemName = textFieldController.text;
              cloudStorage.upDateItemName(
                itemName: itemName,
                documentId: documentId,
                listId: listId,
              );
              //  print(documentId);
              // print(itemName);
              Navigator.pop(context);
              textFieldController.clear();
            },
          ),
        ],
      );
    },
  );
}
