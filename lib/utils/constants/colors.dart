import 'package:flutter/material.dart';

class SSAppColors {
  // Constant
  static const Color primary = Color(0xFFFF6B00);
  static const Color gray = Colors.grey;

  // Light Theme
  static const Color colorLight = Color(0xFF545353);
  static const Color secondaryLight = Color(0xFF2F2F2F);
  static const Color backgroundLight = Color(0xFFFDFDFD);
  static const Color surfaceLight = Color(0xFFF2F2F2);
  static const Color textPrimaryLight = Color(0xFF1A1A1A);
  static const Color textSecondaryLight = Color(0xFF666666);
  static const Color accentLight = Color(0xFF009CFF);
  static const Color errorLight = Color(0xFFE53935);
  static const Color successLight = Color(0xFF4CAF50);
  static const List<BoxShadow> lightShadow = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      spreadRadius: 1,
      offset: Offset(0, 4),
    ),
  ];

  // Dark Theme
  static const Color colorDark = Color(0xFFFFFFFF);
  static const Color secondaryDark = Color(0xFF1F1F1F);
  static const Color backgroundDark = Color(0xFF111111);
  // static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB3B3B3);
  static const Color accentDark = Color(0xFF3ABFFF);
  static const Color errorDark = Color(0xFFEF5350);
  static const Color successDark = Color(0xFF66BB6A);
  static const List<BoxShadow> darkShadow = [
    BoxShadow(
      color: Colors.black54,
      blurRadius: 6,
      spreadRadius: 0,
      offset: Offset(0, 3),
    ),
  ];

  // Neutral Shades
static const Color black = Color(0xFF232323);
static const Color darkerGrey = Color(0xFF4F4F4F);
static const Color darkGrey = Color(0xFF939393);
static const Color grey = Color(0xFFE0E0E0);
static const Color softGrey = Color(0xFFF4F4F4);
static const Color lightGrey = Color(0xFFF9F9F9);
static const Color white = Color(0xFFFFFFFF);
}
