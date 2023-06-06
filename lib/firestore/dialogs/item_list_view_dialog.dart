// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

import '../data/models/cloud_list_item.dart';
import '../widgets/list_item_view.dart';
import 'add_list_item_dialog.dart';

Future<void> ShowListItemViewDialog(BuildContext context, String listName,
    String documentId, String listId) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(listName), // store list title here
          content: SizedBox(
            width: 550.0,
            height: 600.0,
            child: StreamBuilder(
              stream: cloudStorage.getListItem(
                listId: listId,
                documentId: documentId,
              ),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      final listItems =
                          snapshot.data as Iterable<CloudListItem>;
                      return ListView.builder(
                        itemCount: listItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final CloudListItem snapshot =
                              listItems.elementAt(index);
                          return ListItemNameView(
                            itemName: snapshot.listItem,
                            listId: snapshot.listId,
                            documentId: snapshot.documentId,
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  default:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  displayAddItemDialog(context, listId);
                },
                backgroundColor: Colors.blueGrey,
                child: const Icon(Icons.add_box),
              ),
            ),
          ],
        );
      });
}
