import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment(
      {super.key,
      required this.text,
      required this.time,
      required this.username});
  final String text;
  final String time;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(text),
          Row(
            children: [
              Text(username.split('@')[0]),
              const Text(' . '),
              Text(time),
            ],
          ),
        ],
      ),
    );
  }
}
