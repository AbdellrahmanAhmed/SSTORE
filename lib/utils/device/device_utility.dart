import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtility {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getKeyboardHeight(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom;
  }

  static bool isKeyboardVisible(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return viewInsets.bottom > 0;
  }

  static void vibrate({Duration duration = const Duration(milliseconds: 100)}) {
    HapticFeedback.vibrate();
  }

  static Orientation getOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  static bool isLandscape(BuildContext context) {
    return getOrientation(context) == Orientation.landscape;
  }

  static bool isPortrait(BuildContext context) {
    return getOrientation(context) == Orientation.portrait;
  }

  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getBottomSafeArea(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static String getDeviceType(BuildContext context) {
    final double deviceWidth = getScreenWidth(context);

    if (kIsWeb) {
      if (deviceWidth > 900) return "Desktop";
      if (deviceWidth > 600) return "Tablet";
      return "Mobile";
    }

    if (deviceWidth >= 900) return "Desktop";
    if (deviceWidth >= 600) return "Tablet";
    return "Mobile";
  }

  static double getResponsiveFontSize(
      BuildContext context, double baseFontSize) {
    final double screenWidth = getScreenWidth(context);
    const double referenceWidth = 390.0;
    return baseFontSize * (screenWidth / referenceWidth);
  }

  static bool isWeb() => kIsWeb;

  static bool isAndroid() => defaultTargetPlatform == TargetPlatform.android;

  static bool isIOS() => defaultTargetPlatform == TargetPlatform.iOS;

  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static bool isLargeScreen(BuildContext context) {
    return getScreenWidth(context) > 600;
  }
}
