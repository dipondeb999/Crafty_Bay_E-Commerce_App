import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const AppBarIconButton({super.key, required this.icon, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        radius: 16,
        child: Icon(
          icon,
          size: 18,
          color: Colors.black45,
        ),
      ),
    );
  }
}