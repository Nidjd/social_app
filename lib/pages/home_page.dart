import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/my_text_field.dart';
import 'package:social_media/components/postComponent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  final postController = TextEditingController();

  void post() {
    if (postController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('posts').add({
        'UserEmail':currentUser!.email,
        'Message':postController.text,
        'TimeStamp':Timestamp.now(),
      });
    }
  }

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          "The Wall",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: logOut,
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("posts")
                    .orderBy(
                      "TimeStamp",
                      descending: false,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if ((snapshot.hasData)) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final post = snapshot.data!.docs[index];
                        return PostComponent(
                          name: post["UserEmail"],
                          text: post["Message"],
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: postController,
                      hintText: 'Write your post here !',
                      isScure: false,
                    ),
                  ),
                  IconButton(
                      onPressed: post, icon: const Icon(Icons.arrow_circle_up))
                ],
              ),
            ),
            Text(
              'You login as a ${currentUser!.email}',
            ),
          ],
        ),
      ),
    );
  }
}
