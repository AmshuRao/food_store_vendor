// ignore_for_file: avoid_print

import "dart:developer";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<String?> getUserEmail() async {
    User? user = getCurrentUser();
    if (user != null) {
      return user.email;
    }
    return null;
  }

  Future<UserCredential> signInWithEmailAndPassword(email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore.collection("Merchant").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("i am here inside the log");
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
    String firstname,
    String lastname,
    String username,
    String phonenumber,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore.collection("Merchant").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "phonenumber": phonenumber,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<void> changePassword(String newPassword, String currentPassword) async {
    print("i am here $newPassword $currentPassword");
    User? user = getCurrentUser();
    if (user != null) {
      try {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);
      } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
      }
    }
  }
}
