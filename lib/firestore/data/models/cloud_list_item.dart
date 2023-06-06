import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../cloud_services/cloud_storage_constants.dart';

class CloudListItem extends ChangeNotifier {
  final String listItem;
  final String documentId;
  final String listId;

  CloudListItem({
    required this.listItem,
    required this.documentId,
    required this.listId,
  });

  CloudListItem.fromSnapShot(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  )   : documentId = snapshot.id,
        listId = snapshot.data()['listId'],
        listItem = snapshot.data()[textFieldListItem];
}
