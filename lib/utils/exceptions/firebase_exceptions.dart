import 'package:flutter/foundation.dart';
import 'package:s_store/utils/constants/text_strings.dart';

import '../helpers/helper_functions.dart';

class SSFirebaseAuthException implements Exception {
  final String code;

  SSFirebaseAuthException(this.code);

  String get message {
    final bool isArabic = HelperFunctions.isArabic();

    switch (code) {
      case 'email-already-in-use':
        return isArabic
            ? 'البريد الإلكتروني مسجل بالفعل. يرجى استخدام بريد آخر.'
            : 'The email is already in use. Please use another one.';

      case 'invalid-email':
        return isArabic
            ? 'عنوان البريد الإلكتروني غير صالح.'
            : 'The email address is invalid.';

      case 'weak-password':
        return isArabic
            ? 'كلمة المرور ضعيفة جداً.'
            : 'The password is too weak.';

      case 'user-disabled':
        return isArabic
            ? 'تم تعطيل هذا الحساب. يرجى الاتصال بالدعم.'
            : 'This account has been disabled. Please contact support.';

      case 'user-not-found':
        return isArabic
            ? 'المستخدم غير موجود. تأكد من البيانات.'
            : 'User not found. Please check the entered information.';

      case 'wrong-password':
        return isArabic
            ? 'كلمة المرور غير صحيحة.'
            : 'The password is incorrect.';

      case 'invalid-verification-code':
        return isArabic
            ? 'رمز التحقق غير صالح.'
            : 'The verification code is invalid.';

      case 'quota-exceeded':
        return isArabic ? 'تم تجاوز الحصة المسموحة.' : 'Quota exceeded.';

      default:
        return isArabic
            ? 'حدث خطأ في المصادقة. الرمز: $code'
            : 'An authentication error occurred. Code: $code';
    }
  }
}

class SSFirebaseException implements Exception {
  final String code;

  SSFirebaseException(this.code);

  String get message {
    final bool ar = HelperFunctions.isArabic();

    switch (code) {
      case 'unknown':
        return ar
            ? 'حدث خطأ غير معروف في قاعدة البيانات.'
            : 'An unknown database error occurred.';

      case 'invalid-custom-token':
        return ar
            ? 'تنسيق التوكن غير صحيح.'
            : 'The custom token format is invalid.';

      case 'user-token-expired':
        return ar
            ? 'انتهت صلاحية الجلسة. يرجى تسجيل الدخول مجدداً.'
            : 'The user token has expired. Please sign in again.';

      case 'too-many-requests':
        return ar
            ? 'تم إرسال طلبات كثيرة جداً. حاول لاحقاً.'
            : 'Too many requests. Try again later.';

      case 'server-error':
        return ar ? 'مشكلة في الاتصال بالخادم.' : 'Server connection error.';

      case 'network-request-failed':
        return ar ? 'لا يوجد اتصال بالإنترنت.' : 'No internet connection.';

      default:
        return ar
            ? 'خطأ غير متوقع في فايربيس. الرمز: $code'
            : 'Unexpected Firebase error. Code: $code';
    }
  }
}

class SSPlatformException implements Exception {
  final String code;

  SSPlatformException(this.code);

  String get message {
    final bool ar = HelperFunctions.isArabic();

    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return ar
            ? 'بيانات الدخول غير صحيحة.'
            : 'Login credentials are invalid.';

      case 'too-many-requests':
        return ar ? 'طلبات كثيرة جداً.' : 'Too many requests.';

      case 'sign_in_failed':
        return ar
            ? 'فشل تسجيل الدخول. حاول مرة أخرى.'
            : 'Sign-in failed. Try again.';

      case 'network-error':
        return ar ? 'خطأ في الشبكة.' : 'Network error.';

      default:
        return ar
            ? 'حدث خطأ في النظام (Platform). الرمز: $code'
            : 'A platform error occurred. Code: $code';
    }
  }
}

class SSFormatException implements Exception {
  final String message;

  const SSFormatException([
    this.message = 'حدث خطأ في تنسيق البيانات.',
  ]);

  factory SSFormatException.fromMessage(String message) {
    return SSFormatException(message);
  }

  String get formattedMessage {
    final bool ar = HelperFunctions.isArabic();
    return ar ? message : message;
  }
}

class SSGeneralException implements Exception {
  String message;

  SSGeneralException(this.message);

  @override
  String toString() {
    if (kDebugMode) {
      print('⚠️ [EXCEPTION] - Original Error Message: $message');
    }

    message = SSAppStrings.genericError;

    return message;
  }
}
