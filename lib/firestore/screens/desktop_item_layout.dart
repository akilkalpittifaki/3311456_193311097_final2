import 'package:flutter/material.dart';

import '../data/models/cloud_list_item.dart';
import '../dialogs/add_list_item_dialog.dart';
import '../widgets/list_item_view.dart';

class DesktopItemLayout extends StatelessWidget {
  final String listName;
  final String documentId;
  final String listId;
  const DesktopItemLayout({
    super.key,
    required this.listName,
    required this.documentId,
    required this.listId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   debugShowCheckedModeBanner: false,

      appBar: AppBar(
        title: Text(listName), //set list names he
      ),
      body: StreamBuilder(
        stream: cloudStorage.getListItem(
          listId: listId,
          documentId: documentId,
        ),
        builder: (context, snapshot) {
          debugShowCheckedModeBanner:
          false;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                final listItems = snapshot.data as Iterable<CloudListItem>;
                return ListView.builder(
                  itemCount: listItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final CloudListItem snapshot = listItems.elementAt(index);
                    return ListItemNameView(
                      itemName: snapshot.listItem,
                      documentId: snapshot.documentId,
                      listId: snapshot.listId,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          displayAddItemDialog(context, listId);
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add_box),
      ),
    );
  }
}
