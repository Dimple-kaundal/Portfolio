import 'package:flutter/material.dart';

void navigateToPage(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false);
}
