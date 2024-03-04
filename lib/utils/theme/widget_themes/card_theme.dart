import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/* -- Light & Dark Card Themes -- */
class AppCardTheme {
  AppCardTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static const lightCardTheme = CardTheme(color: AppColors.light);

  /* -- Dark Theme -- */
  static const darkCardTheme = CardTheme(color: AppColors.dark);
}
