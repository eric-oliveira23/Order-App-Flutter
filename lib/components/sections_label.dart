import 'package:flutter/cupertino.dart';

class SectionsLabel extends StatelessWidget {
  final String label;
  const SectionsLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
