import 'package:flutter/material.dart';

import '../dialogs/add_list_item_dialog.dart';
import '../dialogs/delete_list_name_dialog.dart';
import '../dialogs/edit_list_item_dialog.dart';

class ListItemNameView extends StatelessWidget {
  final String listId;
  final String documentId;
  final String itemName;

  const ListItemNameView({
    super.key,
    required this.itemName,
    required this.listId,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(itemName),
            subtitle: const Text('March 1, 2023'),
            leading: const Icon(Icons.list),
            trailing: SizedBox(
              height: 150,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      final shouldDelete = await showDeleteDialog(context);
                      if (shouldDelete) {
                        cloudStorage.deleteListItem(documentId: documentId);
                      }
                    },
                    child: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      ShowEditItemNameDialog(
                        context,
                        documentId,
                        listId,
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      //checkbox onClick check box
                    },
                    icon: const Icon(Icons.check_box),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
