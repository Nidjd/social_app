import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final String name;
  final String text;
  const PostComponent({super.key, required this.name, required this.text});

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
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Icon(Icons.person),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 17, color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(text),
            ],
          ),
        ],
      ),
    );
  }
}
