import 'package:flutter/material.dart';

class DetailLabel extends StatelessWidget {
  final String label;
  const DetailLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(color: Colors.grey),
    );
  }
}
