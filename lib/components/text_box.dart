import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String sectionName;
  final String text;
  final void Function()? onPressed;
  const MyTextBox(
      {super.key,
      required this.sectionName,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      padding: const EdgeInsets.only(
        left: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: TextStyle(color: Colors.grey[500]),
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}
