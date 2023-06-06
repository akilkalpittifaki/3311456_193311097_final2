// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../dialogs/add_list_item_dialog.dart';
import '../dialogs/delete_list_name_dialog.dart';
import '../dialogs/edit_list_name_dialog.dart';
import '../screens/desktop_item_layout.dart';

class MobileListNameView extends StatelessWidget {
  final String listName;
  final String documentId;
  final String listId;

  const MobileListNameView({
    super.key,
    required this.listName,
    required this.documentId,
    required this.listId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => DesktopItemLayout(
            listName: listName,
            documentId: documentId,
            listId: listId,
          ),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 24,
        margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                      child: Text(
                        listName,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 5),
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
