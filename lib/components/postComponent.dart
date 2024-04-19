import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/comment_button.dart';
import 'package:social_media/components/like_button.dart';

class PostComponent extends StatefulWidget {
  final String name;
  final String text;
  final String postId;
  final List<String> likes;

  const PostComponent({
    super.key,
    required this.name,
    required this.text,
    required this.postId,
    required this.likes,
  });

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  final currentUser = FirebaseAuth.instance.currentUser;
  bool isLiked = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    isLiked = widget.likes.contains(currentUser!.email);
    super.initState();
  }

  void toggleLike() {
    isLiked = !isLiked;
    setState(() {});

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('posts').doc(widget.postId);

    if (isLiked) {
      documentReference.update({
        'likes': FieldValue.arrayUnion([currentUser!.email]),
      });
    } else {
      documentReference.update({
        'likes': FieldValue.arrayRemove([currentUser!.email])
      });
    }
  }

  void addComment(String commentText) async {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .collection('comments')
        .add({
      'commentText': commentText,
      'commentedBy': currentUser!.email,
      'commentTime': Timestamp.now(),
    });
  }

  void showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add comment',
        ),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'add comment',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                addComment(_controller.text);
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              'send',
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'cancel',
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
        left: 25,
        right: 25,
      ),
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 17, color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(widget.text),
              const SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      LikeButton(
                        isLiked: isLiked,
                        onTap: toggleLike,
                      ),
                      Text(widget.likes.length.toString())
                    ],
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    children: [
                      CommentButton(
                        onTap: showCommentDialog,
                      ),
                      const Text('0')
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
