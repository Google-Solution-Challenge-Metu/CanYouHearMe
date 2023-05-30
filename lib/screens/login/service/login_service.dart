import 'package:dietapp/main.dart';
import 'package:dietapp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

import '../auth_login.dart';

class FirebaseUserAuthentication {
  final FirebaseAuth _auth;

  FirebaseUserAuthentication(this._auth);

//State Management

  Stream<User?> get authState => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  Future<void> logout() async {
    await _auth.signOut();
  }

  static Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.toString().trim(),
        password: password.toString().trim(),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        wrongEmailMessage(context);
      } else if (e.code == "wrong-password") {
        wrongPasswordMessage(context);
      } else {
        nothingMessage(context);
      }
    }
  }

  static void wrongEmailMessage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xffe97d47),
          title: Text(
            LocaleKeys.Login_service_incrtmail.tr(),
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  static void wrongPasswordMessage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xffe97d47),
          title: Text(
            LocaleKeys.Login_service_incrtmail.tr(),
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  static void nothingMessage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xffe97d47),
          title: Text(
            LocaleKeys.Login_service_incrtboth.tr(),
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
