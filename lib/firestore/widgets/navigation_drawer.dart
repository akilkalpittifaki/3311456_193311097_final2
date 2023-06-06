import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../dialogs/add_list_name_dialog.dart';

class MobileNavigationDrawer extends StatelessWidget {
  MobileNavigationDrawer({Key? key}) : super(key: key);
  final currentUser = FirebaseAuth.instance.currentUser!;

  Widget buildListTile(
    String title,
    IconData icon,
  ) {
    return Builder(
      builder: (context) {
        return ListTile(
          leading: Icon(
            icon,
            size: 26,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            if (title == 'Add New List') {
              ShowAddListDialog(context);
            } else if (title == 'Profile') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: Text(currentUser.email!),
                    ),
                  ),
                ),
              );
            } else if (title == 'Log Out') {
              FirebaseAuth.instance.signOut();
            }
          },
        );
      },
    );
  }

  @override
  build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 55,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Colors.blueGrey, //Theme.of(context).colorScheme.secondary,
            child: const Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: Colors.white, //Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 30),
          //  buildListTile('Home', Icons.home),
          buildListTile('Profile', Icons.person),
          buildListTile('Add New List', Icons.list),
          buildListTile('Log Out', Icons.logout),
        ],
      ),
    );
  }
}
