import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:s_store/features/authentication/screens/login/login.dart';
import 'package:s_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s_store/features/authentication/screens/signup/verify_email.dart';
import 'package:s_store/navigation_menu.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    if (kDebugMode) {
      print('✅ [AUTH-REPOSITORY] - onReady: Starting authentication checks...');
    }

    Future.delayed(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
      if (kDebugMode) {
        print(
            '✅ [AUTH-REPOSITORY] - Splash Screen removed after 1 second delay.');
      }
      screenRedirect();
    });
  }

  screenRedirect() async {
    if (kDebugMode) {
      print(
          '⚙️ [AUTH-REPOSITORY] - screenRedirect: Determining first screen...');
    }

    final user = _auth.currentUser;

    if (user != null) {
      if (kDebugMode) {
        print(
            '👤 [AUTH-REPOSITORY] - screenRedirect: User is logged in (${user.uid}).');
      }

      if (user.emailVerified) {
        if (kDebugMode) {
          print(
              '📧 [AUTH-REPOSITORY] - screenRedirect: Email Verified. Moving to Navigation Menu...');
        }
        Get.offAll(() => const NavigationMenu());
      } else {
        if (kDebugMode) {
          print(
              '⚠️ [AUTH-REPOSITORY] - screenRedirect: Email NOT Verified. Moving to Verification Screen...');
        }
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      if (kDebugMode) {
        print(
            '👻 [AUTH-REPOSITORY] - screenRedirect: No User logged in. Checking local storage...');
      }

      deviceStorage.writeIfNull('IsFirstTime', true);

      final isFirstTime = deviceStorage.read('IsFirstTime');
      if (kDebugMode) {
        print('💾 [AUTH-REPOSITORY] - IsFirstTime value: $isFirstTime');
      }

      if (isFirstTime != true) {
        if (kDebugMode) {
          print(
              '➡️ [AUTH-REPOSITORY] - screenRedirect: Not first time. Moving to Login Screen.');
        }
        Get.offAll(() => const LoginScreen());
      } else {
        if (kDebugMode) {
          print(
              '🌟 [AUTH-REPOSITORY] - screenRedirect: First time user. Moving to OnBoarding Screen.');
        }
        Get.offAll(() => const OnBoardingScreen());
      }
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    if (kDebugMode) {
      print('⚡️ [AUTH-LOGIN] - Attempting to log in user: $email');
    }

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (kDebugMode) {
        print(
            '✅ [AUTH-LOGIN] - Login Successful. UID: ${userCredential.user?.uid}');
      }

      return userCredential;
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-LOGIN] - Caught SSFirebaseAuthException. Code: ${e.code}');
      }

      throw SSFirebaseAuthException(e.code).message;
    } on SSFirebaseException catch (e) {
      if (kDebugMode) {
        print('❌ [AUTH-LOGIN] - Caught SSFirebaseException. Code: ${e.code}');
      }

      throw SSFirebaseException(e.code).message;
    } on SSFormatException catch (_) {
      if (kDebugMode) {
        print('❌ [AUTH-LOGIN] - Caught SSFormatException.');
      }

      throw const SSFormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print('❌ [AUTH-LOGIN] - Caught SSPlatformException. Code: ${e.code}');
      }

      throw SSPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('🔥 [AUTH-LOGIN] - Caught UNEXPECTED Error: ${e.runtimeType}');
      }

      throw SSGeneralException(e.toString()).message;
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    if (kDebugMode) {
      print('⚡️ [AUTH-REGISTER] - Attempting to register user: $email');
    }
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (kDebugMode) {
        print(
            '✅ [AUTH-REGISTER] - Registration Successful. UID: ${userCredential.user?.uid}');
      }
      return userCredential;
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-REGISTER] - Caught SSFirebaseAuthException. Code: ${e.code}');
      }

      throw SSFirebaseAuthException(e.code).message;
    } on SSFirebaseException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-REGISTER] - Caught SSFirebaseException. Code: ${e.code}');
      }

      throw SSFirebaseException(e.code).message;
    } on SSFormatException catch (_) {
      if (kDebugMode) {
        print('❌ [AUTH-REGISTER] - Caught SSFormatException.');
      }

      throw const SSFormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-REGISTER] - Caught SSPlatformException. Code: ${e.code}');
      }

      throw SSPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('🔥 [AUTH-REGISTER] - Caught UNEXPECTED Error: ${e.runtimeType}');
      }

      throw SSGeneralException(e.toString()).message;
    }
  }

  Future<void> sendEmailVerification() async {
    if (kDebugMode) {
      print(
          '✉️ [AUTH-EMAIL-VERIFY] - Attempting to send verification email...');
    }
    try {
      final userEmail = _auth.currentUser?.email ?? 'N/A';
      await _auth.currentUser?.sendEmailVerification();

      if (kDebugMode) {
        print(
            '✅ [AUTH-EMAIL-VERIFY] - Verification email sent successfully to $userEmail.');
      }
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-EMAIL-VERIFY] - Caught SSFirebaseAuthException. Code: ${e.code}');
      }

      throw SSFirebaseAuthException(e.code).message;
    } on SSFirebaseException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-EMAIL-VERIFY] - Caught SSFirebaseException. Code: ${e.code}');
      }

      throw SSFirebaseException(e.code).message;
    } on SSFormatException catch (_) {
      if (kDebugMode) {
        print('❌ [AUTH-EMAIL-VERIFY] - Caught SSFormatException.');
      }

      throw const SSFormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-EMAIL-VERIFY] - Caught SSPlatformException. Code: ${e.code}');
      }

      throw SSPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print(
            '🔥 [AUTH-EMAIL-VERIFY] - Caught UNEXPECTED Error: ${e.runtimeType}');
      }

      throw SSGeneralException(e.toString()).message;
    }
  }

  Future<void> logout() async {
    if (kDebugMode) {
      print('🚪 [AUTH-LOGOUT] - Starting user logout process...');
    }
    try {
      await FirebaseAuth.instance.signOut();

      if (kDebugMode) {
        print(
            '✅ [AUTH-LOGOUT] - Logout successful. Navigating to Login Screen...');
      }
      Get.offAll(() => const LoginScreen());
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-LOGOUT] - Caught SSFirebaseAuthException. Code: ${e.code}');
      }

      throw SSFirebaseAuthException(e.code).message;
    } on SSFirebaseException catch (e) {
      if (kDebugMode) {
        print('❌ [AUTH-LOGOUT] - Caught SSFirebaseException. Code: ${e.code}');
      }

      throw SSFirebaseException(e.code).message;
    } on SSFormatException catch (_) {
      if (kDebugMode) {
        print('❌ [AUTH-LOGOUT] - Caught SSFormatException.');
      }

      throw const SSFormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print('❌ [AUTH-LOGOUT] - Caught SSPlatformException. Code: ${e.code}');
      }

      throw SSPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('🔥 [AUTH-LOGOUT] - Caught UNEXPECTED Error: ${e.runtimeType}');
      }

      throw SSGeneralException(e.toString()).message;
    }
  }

  Future<void> sendPasswordRestEmail(String email) async {
    if (kDebugMode) {
      print(
          '✉️ [AUTH-PASSWORD-RESET] - Attempting to send password reset email to $email...');
    }
    try {
      await _auth.sendPasswordResetEmail(email: email);

      if (kDebugMode) {
        print(
            '✅ [AUTH-PASSWORD-RESET] - Password reset email sent successfully to $email.');
      }
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-PASSWORD-RESET] - Caught SSFirebaseAuthException. Code: ${e.code}');
      }

      throw SSFirebaseAuthException(e.code).message;
    } on SSFirebaseException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-PASSWORD-RESET] - Caught SSFirebaseException. Code: ${e.code}');
      }

      throw SSFirebaseException(e.code).message;
    } on SSFormatException catch (_) {
      if (kDebugMode) {
        print('❌ [AUTH-PASSWORD-RESET] - Caught SSFormatException.');
      }

      throw const SSFormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-PASSWORD-RESET] - Caught SSPlatformException. Code: ${e.code}');
      }

      throw SSPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print(
            '🔥 [AUTH-PASSWORD-RESET] - Caught UNEXPECTED Error: ${e.runtimeType}');
        print('🚨 [AUTH-PASSWORD-RESET] - Error Details: ${e.toString()}');
      }

      throw SSGeneralException(e.toString()).message;
    }
  }

/*---------------------------------- SOCIAL SIGN IN ----------------------------------*/

  Future<UserCredential?> signInWithGoogle() async {
    if (kDebugMode) {
      print('🚪 [AUTH-GOOGLE] - Starting Google sign-in process...');
    }
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      if (kDebugMode) {
        print(
            '✅ [AUTH-GOOGLE] - GoogleSignInAccount retrieved: ${userAccount?.email}');
      }

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      if (kDebugMode) {
        print('✅ [AUTH-GOOGLE] - GoogleAuth tokens received. '
            'AccessToken: ${googleAuth?.accessToken != null}, '
            'IdToken: ${googleAuth?.idToken != null}');
      }

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      if (kDebugMode) {
        print('🔑 [AUTH-GOOGLE] - Firebase credential created successfully.');
      }

      final userCredential = await _auth.signInWithCredential(credentials);
      if (kDebugMode) {
        print(
            '🎉 [AUTH-GOOGLE] - User signed in successfully. UID: ${userCredential.user?.uid}');
      }
      return userCredential;
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [AUTH-GOOGLE] - Caught SSFirebaseAuthException. Code: ${e.code}');
      }
      throw SSFirebaseAuthException(e.code).message;
    } on SSFirebaseException catch (e) {
      if (kDebugMode) {
        print('❌ [AUTH-GOOGLE] - Caught SSFirebaseException. Code: ${e.code}');
      }
      throw SSFirebaseException(e.code).message;
    } on SSFormatException catch (_) {
      if (kDebugMode) {
        print('❌ [AUTH-GOOGLE] - Caught SSFormatException.');
      }
      throw const SSFormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print('❌ [AUTH-GOOGLE] - Caught SSPlatformException. Code: ${e.code}');
      }
      throw SSPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print(
            '🔥 [AUTH-GOOGLE] - Caught UNEXPECTED Error: ${e.runtimeType}, Details: $e');
      }
      throw SSGeneralException(e.toString()).message;
    }
  }
}
