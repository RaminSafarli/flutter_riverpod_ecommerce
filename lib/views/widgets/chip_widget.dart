import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const ChipWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () {
          debugPrint("Hello");
        },
        child: Chip(
          labelStyle: const TextStyle(color: Colors.grey),
          label: Text(
            title,
            style: const TextStyle(fontSize: 10),
          ),
          avatar: Icon(icon, color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 1,
        ),
      ),
    );
  }
}
