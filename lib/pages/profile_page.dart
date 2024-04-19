import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<void> editingField(String field) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Icon(
            Icons.person,
            size: 72,
          ),
          Text(
            currentUser!.email.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25.0,
            ),
            child: Text(
              'My Details',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
          MyTextBox(
            sectionName: 'user name  ',
            text: 'Mohammed',
            onPressed: () => editingField('username'),
          ),
          MyTextBox(
            sectionName: 'bio  ',
            text: 'empty bio',
            onPressed: () => editingField('bio'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 50.0),
            child: Text(
              'My Posts',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
