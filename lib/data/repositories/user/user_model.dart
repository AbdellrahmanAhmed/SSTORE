// Model class representing user data
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  /// Keep those values final which you do not want update
  final String id, username, email;
  String firstName, lastName, phoneNumber, profilePicture;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper Function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper Function to get the full name.
// --

  /// Helper Function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  /// Static function to create on empty user model;
  static UserModel empty() => UserModel(
      id: ' ',
      username: ' ',
      email: ' ',
      firstName: ' ',
      lastName: ' ',
      phoneNumber: ' ',
      profilePicture: ' ');

  /// Convert model to JSON structure for staring data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data == null) {
      return UserModel(
        id: document.id,
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );
    }

    return UserModel(
      id: document.id,
      username: data['Username'] ?? '',
      email: data['Email'] ?? '',
      firstName: data['FirstName'] ?? '',
      lastName: data['LastName'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      profilePicture: data['ProfilePicture'] ?? '',
    );
  }
}
