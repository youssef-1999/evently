import 'package:flutter/material.dart';

class Snackbar {
  static void successSnackbar(String message, BuildContext context) {
    _showSnackbar(message, context, Colors.green);
  }

  static void errorSnackbar(String message, BuildContext context) {
    _showSnackbar(message, context, Colors.red);
  }

  static void _showSnackbar(
    String message,
    BuildContext context,
    Color backgroundColor,
  ) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
