import 'package:flutter/material.dart';
import 'package:social_media/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: const Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.person,
              size: 57,
              color: Colors.white,
            ),
          ),
          MyListTile(
            icon: Icons.home,
            text: 'H O M E',
          ),
          MyListTile(
            icon: Icons.person,
            text: 'P R O F I L E',
          ),
          Spacer(),
          MyListTile(
            icon: Icons.logout,
            text: 'L O G O U T',
          ),
          SizedBox(
            height: 14,
          )
        ],
      ),
    );
  }
}
