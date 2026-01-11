import 'package:flutter/material.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:s_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:s_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:s_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:s_store/utils/theme/custom_themes/input_decoration_theme.dart';
import 'package:s_store/utils/theme/custom_themes/navigation_bar_theme.dart';
import 'package:s_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:s_store/utils/theme/custom_themes/text_theme.dart';

class SSAppTheme {
  SSAppTheme._(); // مانعملش منه object
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: SSAppColors.primary,
    scaffoldBackgroundColor: SSAppColors.backgroundLight,
    textTheme: SSTextTheme.lightTextTheme,
    chipTheme: SSChipTheme.lightChipTheme,
    checkboxTheme: SSCheckboxTheme.checkboxTheme,
    bottomSheetTheme: SSBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SSElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SSOutlinedButtonTheme.lighOutlinedButtonTheme,
    inputDecorationTheme: SSInputDecorationTheme.lightInputDecorationTheme,
    navigationBarTheme: SSNavigationBarTheme.lightNavigationBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: SSAppColors.primary,
    scaffoldBackgroundColor: SSAppColors.backgroundDark,
    textTheme: SSTextTheme.darkTextTheme,
    chipTheme: SSChipTheme.darkChipTheme,
    checkboxTheme: SSCheckboxTheme.checkboxTheme,
    bottomSheetTheme: SSBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SSElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SSOutlinedButtonTheme.darkOutlinedButtonTheme,
    navigationBarTheme: SSNavigationBarTheme.darkNavigationBarTheme,
  );
}
