import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/components/my_list_tile.dart';
import 'package:social_media/pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.person,
              size: 57,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const MyListTile(
              icon: Icons.home,
              text: 'H O M E',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ));
            },
            child: const MyListTile(
              icon: Icons.person,
              text: 'P R O F I L E',
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: const MyListTile(
              icon: Icons.logout,
              text: 'L O G O U T',
            ),
          ),
          const SizedBox(
            height: 14,
          )
        ],
      ),
    );
  }
}
