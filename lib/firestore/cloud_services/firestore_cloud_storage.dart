// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/models/cloud_list_item.dart';
import '../data/models/cloud_list_name.dart';
import 'cloud_storage_constants.dart';
import 'cloud_storage_exceptions.dart';

class FireStoreCloudStorage extends ChangeNotifier {
  final itemNames = FirebaseFirestore.instance.collection('list_item');
  final listNames = FirebaseFirestore.instance.collection('list_name');
  final currentUser = FirebaseAuth.instance.currentUser!;

//Create new list
  Future<CloudListName> createNewList({
    required String ownerUserId,
    required String listName,
  }) async {
    final document = await listNames.add(
      {
        textFieldListName: listName,
        ownerUserIdFieldName: ownerUserId,
      },
    );
    notifyListeners();

    var fetchListName = await document.get();
    return CloudListName(
        ownerUserId: ownerUserId,
        listName: textFieldListName,
        documentId: fetchListName.id);
  }

  //Create new item
  Future<CloudListItem> createNewListItem({
    required String ownerUserId,
    required String listId,
    required String listItem,
  }) async {
    final document = await itemNames.add(
      {
        "listId": listId,
        ownerUserIdFieldName: ownerUserId,
        textFieldListItem: listItem,
      },
    );
    notifyListeners();

    var fetchItem = await document.get();
    return CloudListItem(
      listId: listId,
      listItem: textFieldListItem,
      documentId: fetchItem.id,
    );
  }

  Stream<Iterable<CloudListName>> getListName({
    required String ownerUserId,
    required String textFieldListName,
  }) {
    return listNames.where("user_id", isEqualTo: ownerUserId).snapshots().map(
          (event) => event.docs.map(
            (docs) => CloudListName.fromSnapShot(docs),
          ),
        );
  }

  Future<Iterable<CloudListName>> allLists(
      {required String ownerUserId}) async {
    try {
      return await listNames
          .where(
            ownerUserId,
            isEqualTo: ownerUserId,
          )
          .get()
          .then((value) => value.docs.map(
                (docs) => CloudListName.fromSnapShot(docs),
              ));
    } catch (e) {
      throw CouldNotGetAllStoreListException();
    }
  }

  Stream<Iterable<CloudListItem>> getListItem({
    required String listId,
    required String documentId,
  }) =>
      itemNames.where("listId", isEqualTo: documentId).snapshots().map(
            (event) => event.docs.map(
              (item) => CloudListItem.fromSnapShot(item),
            ),
          );

  Future<Iterable<CloudListItem>> allItems(
      {required String ownerUserId}) async {
    try {
      return await itemNames
          .where(ownerUserId, isEqualTo: ownerUserId)
          .get()
          .then((value) =>
              value.docs.map((docs) => CloudListItem.fromSnapShot(docs)));
    } catch (e) {
      throw CouldNotGetAllStoreListException();
    }
  }

  Future<void> deleteListName({required String documentId}) async {
    try {
      await listNames.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteStoreListException();
    }
  }

  Future<void> deleteListItem({required String documentId}) async {
    try {
      await itemNames.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteStoreListException();
    }
    notifyListeners();
  }

  Future<void> upDateListName({
    required String documentId,
    required String listName,
  }) async {
    try {
      await listNames.doc(documentId).update({'list_name': listName});
    } catch (e) {
      throw CouldNotUpdateStoreListException();
    }
    notifyListeners();
  }

//Update Item name
  Future<void> upDateItemName(
      {required String itemName,
      required String documentId,
      required String listId

      // required String date,
      }) async {
    try {
      await itemNames.doc(documentId).update({'item_name': itemName});
    } catch (e) {
      throw CouldNotUpdateStoreListException();
    }

    notifyListeners();
  }

  static final FireStoreCloudStorage _shared =
      FireStoreCloudStorage._sharedInstance();
  FireStoreCloudStorage._sharedInstance();

  factory FireStoreCloudStorage() => _shared;
}
