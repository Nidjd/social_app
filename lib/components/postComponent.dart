import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final String name;
  final String text;
  const PostComponent({super.key, required this.name, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(name),
        Text(text),
      ],
    );
  }
}
