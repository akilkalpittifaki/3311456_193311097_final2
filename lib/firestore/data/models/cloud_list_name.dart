import 'package:cloud_firestore/cloud_firestore.dart';

import '../../cloud_services/cloud_storage_constants.dart';

class CloudListName {
  final String ownerUserId;
  final String listName;
  final String documentId;

  CloudListName({
    required this.ownerUserId,
    required this.listName,
    required this.documentId,
  });

  CloudListName.fromSnapShot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        ownerUserId = snapshot.data()[ownerUserIdFieldName],
        listName = snapshot.data()[textFieldListName];
}
