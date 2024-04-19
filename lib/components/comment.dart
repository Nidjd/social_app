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
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          Divider(),
          Row(
            children: [
              Text(
                username.split('@')[0],
                style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.bold),
              ),
              Text(
                ' . ',
                style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.bold),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
