import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:s_store/data/repositories/user/user_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../authentication/authentication_repository.dart';

// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      if (kDebugMode) {
        print(
            '🟢 [USER-REPO] - Attempting to save user record with ID: ${user.id}');
      }

      await _db.collection("Users").doc(user.id).set(user.toJson());

      if (kDebugMode) {
        print(
            '✅ [USER-REPO] - User record saved successfully for ID: ${user.id}');
      }
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSFirebaseAuthException while saving user. Code: ${e.code}');
      }
      throw SSFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - FirebaseException while saving user. Code: ${e.code}');
      }
      throw SSFirebaseException(e.code).message;
    } on FormatException catch (_) {
      if (kDebugMode) {
        print('❌ [USER-REPO] - FormatException while saving user.');
      }
      throw const FormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSPlatformException while saving user. Code: ${e.code}');
      }
      throw SSPlatformException(e.code).message;
    } on SSGeneralException catch (e) {
      if (kDebugMode) {
        print(
            '🔥 [USER-REPO] - GeneralException while saving user. Details: ${e.message}');
      }
      throw SSGeneralException(e.message).message;
    }
  }

  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails() async {
    try {
      final uid = AuthenticationRepository.instance.authUser?.uid;
      if (kDebugMode) {
        print('📡 [USER-REPO] - Fetching user details for UID: $uid');
      }

      final documentSnapshot = await _db.collection("Users").doc(uid).get();

      if (documentSnapshot.exists) {
        if (kDebugMode) {
          print('✅ [USER-REPO] - User details found for UID: $uid');
        }
        return UserModel.fromSnapShot(documentSnapshot);
      } else {
        if (kDebugMode) {
          print('⚠️ [USER-REPO] - No user record found for UID: $uid');
        }
        return UserModel.empty();
      }
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSFirebaseAuthException while fetching user. Code: ${e.code}');
      }
      throw SSFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - FirebaseException while fetching user. Code: ${e.code}');
      }
      throw SSFirebaseException(e.code).message;
    } on FormatException catch (_) {
      if (kDebugMode) {
        print('❌ [USER-REPO] - FormatException while fetching user.');
      }
      throw const FormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSPlatformException while fetching user. Code: ${e.code}');
      }
      throw SSPlatformException(e.code).message;
    } on SSGeneralException catch (e) {
      if (kDebugMode) {
        print(
            '🔥 [USER-REPO] - GeneralException while fetching user. Details: ${e.message}');
      }
      throw SSGeneralException(e.message).message;
    }
  }

  /*---------------------------------- UPDATE USER DATA ----------------------------------*/

  /// Function to update user data in Firestore.
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      if (kDebugMode) {
        print(
            '🟢 [USER-REPO] - Attempting to update user record with ID: ${updatedUser.id}');
      }

      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .set(updatedUser.toJson());

      if (kDebugMode) {
        print(
            '✅ [USER-REPO] - User record updated successfully for ID: ${updatedUser.id}');
      }
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSFirebaseAuthException while updating user. Code: ${e.code}');
      }
      throw SSFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - FirebaseException while updating user. Code: ${e.code}');
      }
      throw SSFirebaseException(e.code).message;
    } on FormatException catch (_) {
      if (kDebugMode) {
        print('❌ [USER-REPO] - FormatException while updating user.');
      }
      throw const FormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSPlatformException while updating user. Code: ${e.code}');
      }
      throw SSPlatformException(e.code).message;
    } on SSGeneralException catch (e) {
      if (kDebugMode) {
        print(
            '🔥 [USER-REPO] - GeneralException while updating user. Details: ${e.message}');
      }
      throw SSGeneralException(e.message).message;
    }
  }

  /// Update any field in specific User Collection.
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      final uid = AuthenticationRepository.instance.authUser?.uid;
      if (kDebugMode) {
        print(
            '🟢 [USER-REPO] - Attempting to update single field for UID: $uid');
        print('📑 [USER-REPO] - Data to update: $json');
      }

      await _db.collection("Users").doc(uid).update(json);

      if (kDebugMode) {
        print(
            '✅ [USER-REPO] - Single field updated successfully for UID: $uid');
      }
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSFirebaseAuthException while updating single field. Code: ${e.code}');
      }
      throw SSFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - FirebaseException while updating single field. Code: ${e.code}');
      }
      throw SSFirebaseException(e.code).message;
    } on FormatException catch (_) {
      if (kDebugMode) {
        print('❌ [USER-REPO] - FormatException while updating single field.');
      }
      throw const FormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSPlatformException while updating single field. Code: ${e.code}');
      }
      throw SSPlatformException(e.code).message;
    } on SSGeneralException catch (e) {
      if (kDebugMode) {
        print(
            '🔥 [USER-REPO] - GeneralException while updating single field. Details: ${e.message}');
      }
      throw SSGeneralException(e.message).message;
    }
  }

  /// Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    try {
      if (kDebugMode) {
        print(
            '🟢 [USER-REPO] - Attempting to remove user record with ID: $userId');
      }

      await _db.collection("Users").doc(userId).delete();

      if (kDebugMode) {
        print(
            '✅ [USER-REPO] - User record removed successfully for ID: $userId');
      }
    } on SSFirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSFirebaseAuthException while removing user. Code: ${e.code}');
      }
      throw SSFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - FirebaseException while removing user. Code: ${e.code}');
      }
      throw SSFirebaseException(e.code).message;
    } on FormatException catch (_) {
      if (kDebugMode) {
        print('❌ [USER-REPO] - FormatException while removing user.');
      }
      throw const FormatException().message;
    } on SSPlatformException catch (e) {
      if (kDebugMode) {
        print(
            '❌ [USER-REPO] - SSPlatformException while removing user. Code: ${e.code}');
      }
      throw SSPlatformException(e.code).message;
    } on SSGeneralException catch (e) {
      if (kDebugMode) {
        print(
            '🔥 [USER-REPO] - GeneralException while removing user. Details: ${e.message}');
      }
      throw SSGeneralException(e.message).message;
    }
  }

}
