import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
