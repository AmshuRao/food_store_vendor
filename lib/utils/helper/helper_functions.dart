import 'package:flutter/material.dart';

class AppHelperFunctions {
  static bool isDarkMode(context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
