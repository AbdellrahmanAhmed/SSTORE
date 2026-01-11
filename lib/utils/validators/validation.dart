import 'package:s_store/utils/helpers/helper_functions.dart';

class SSValidator {
  static String _tr(String ar, String en) =>
      HelperFunctions.isArabic() ? ar : en;

  /// Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('البريد الإلكتروني مطلوب.', 'Email is required.');
    }

    final emailRegExp = RegExp(r"^[\w\.-]+@[\w\.-]+\.[A-Za-z]{2,}$");
    if (!emailRegExp.hasMatch(value)) {
      return _tr('البريد الإلكتروني غير صالح.', 'Invalid email address.');
    }
    return null;
  }

  /// Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('كلمة المرور مطلوبة.', 'Password is required.');
    }

    if (value.length < 8) {
      return _tr('يجب أن تكون كلمة المرور 8 أحرف على الأقل.',
          'Password must be at least 8 characters long.');
    }

    if (!value.contains(RegExp(r"[A-Z]"))) {
      return _tr('يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل.',
          'Password must contain at least one uppercase letter.');
    }

    if (!value.contains(RegExp(r"[0-9]"))) {
      return _tr('يجب أن تحتوي كلمة المرور على رقم واحد على الأقل.',
          'Password must contain at least one number.');
    }

    if (!value.contains(RegExp(r'[!@#\$%\^&*(),."?:{}|<>]'))) {
    return _tr('يجب أن تحتوي كلمة المرور على رمز خاص.',
    'Password must contain at least one special character.');
    }

    return null;
    }

  /// Username Validation
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('اسم المستخدم مطلوب.', 'Username is required.');
    }

    if (value.length < 3) {
      return _tr('اسم المستخدم قصير جدًا.', 'Username is too short.');
    }

    return null;
  }

  /// Phone Number
  static String? validatePhone(String? value) {
    // 1. تحقق من قيمة فارغة أو غير موجودة
    if (value == null || value.isEmpty) {
      return _tr('رقم الهاتف مطلوب.', 'Phone number is required.');
    }

    // 2. تنظيف السلسلة من المسافات البيضاء في البداية والنهاية
    final trimmedValue = value.trim();

    // 3. تطبيق التعبير العادي الدقيق (بالعلامة $)
    // ^01[0-9]{9}$ - يجب أن يبدأ بـ 01 ويتبعه 9 أرقام، وينتهي هنا (المجموع 11 رقمًا).
    final phoneReg = RegExp(r"^(1)[0-8]{9}$");

    if (!phoneReg.hasMatch(trimmedValue)) {
      return _tr('رقم الهاتف غير صالح.', 'Invalid phone number.');
    }

    return null;
  }

  /// Generic Required Field
  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('هذا الحقل مطلوب.', 'This field is required.');
    }
    return null;
  }

  /// Address Validation
  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('العنوان مطلوب.', 'Address is required.');
    }
    if (value.length < 5) {
      return _tr('العنوان قصير جدًا.', 'Address is too short.');
    }
    return null;
  }

  /// OTP Validation
  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return _tr('رمز التحقق مطلوب.', 'OTP code is required.');
    }
    if (value.length != 6) {
      return _tr('رمز التحقق يجب أن يكون 6 أرقام.', 'OTP must be 6 digits.');
    }
    return null;
  }
}
