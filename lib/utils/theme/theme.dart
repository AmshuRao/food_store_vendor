import 'package:flutter/material.dart';
import 'package:food_store/utils/theme/widget_themes/appbar_theme.dart';
import 'package:food_store/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:food_store/utils/theme/widget_themes/card_theme.dart';
import 'package:food_store/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:food_store/utils/theme/widget_themes/chip_theme.dart';
import 'package:food_store/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:food_store/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:food_store/utils/theme/widget_themes/text_field_theme.dart';
import 'package:food_store/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    cardTheme: AppCardTheme.lightCardTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    cardTheme: AppCardTheme.darkCardTheme,
  );
}
