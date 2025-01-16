import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String message, [bool isErrorMessage = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
          message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: isErrorMessage ? AppColors.themeColor : Colors.red,
    ),
  );
}