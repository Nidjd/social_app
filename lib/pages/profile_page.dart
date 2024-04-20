import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> editingField(String field) async {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          'edit $field',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        content: TextField(
          controller: controller,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: 'write new $field',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              if (field == 'username') {
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(currentUser!.email)
                    .update({
                  'username': controller.text,
                });
              } else if (field == 'bio') {
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(currentUser!.email)
                    .update({
                  'bio': controller.text,
                });
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> editingBio(String field) async {
  //   // await FirebaseFirestore.instance
  //   //     .collection('Users')
  //   //     .doc(currentUser!.email)
  //   //     .update({
  //   //   'username': field,
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(currentUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView(
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
                    text: data!['username'],
                    onPressed: () => editingField('username'),
                  ),
                  MyTextBox(
                    sectionName: 'bio  ',
                    text: data['bio'],
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
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
