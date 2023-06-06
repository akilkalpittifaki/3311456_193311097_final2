// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

import '../dialogs/add_list_item_dialog.dart';
import '../dialogs/delete_list_name_dialog.dart';
import '../dialogs/edit_list_name_dialog.dart';
import '../dialogs/item_list_view_dialog.dart';

class ListNameView extends StatelessWidget {
  final String listName;
  final String documentId;

  const ListNameView({
    super.key,
    required this.listName,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ShowListItemViewDialog(
          context,
          listName,
          documentId,
          documentId,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        elevation: 24,
        margin: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2016/05/19/09/32/checklist-1402461_960_720.png',
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: 10,
                    child: Container(
                      color: Colors.black54,
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                      child: Text(
                        listName,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 0),
                  TextButton(
                    onPressed: () {
                      ShowEditListNameDialog(context, documentId);
                    },
                    child: const Icon(Icons.edit),
                  ),
                  TextButton(
                    onPressed: () async {
                      final shouldDelete = await showDeleteDialog(context);
                      if (shouldDelete) {
                        cloudStorage.deleteListName(documentId: documentId);
                      }
                    },
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
