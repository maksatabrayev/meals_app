import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.label, required this.iconData});
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData, color: Colors.white, size: 17),
        const SizedBox(width: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ],
    );
  }
}
