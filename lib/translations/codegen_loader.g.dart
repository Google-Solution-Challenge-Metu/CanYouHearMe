// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "language": "english",
  "helloWord": "Hello Word",
  "forget_password_reset": "Password reset email sent successfully.",
  "forget_password_forgot_title": "Forgot Password Page",
  "forget_password_enterEmail": "Enter your email and we'll send you a password reset link.",
  "forget_password_enterHere": "Enter your email here.",
  "forget_password_sendPswrd": "Send Password Reset Email"
};
static const Map<String,dynamic> en = {
  "language": "english",
  "helloWord": "Hello Word",
  "forget_password_reset": "Password reset email sent successfully.",
  "forget_password_forgot_title": "Forgot Password Page",
  "forget_password_enterEmail": "Enter your email and we'll send you a password reset link.",
  "forget_password_enterHere": "Enter your email here.",
  "forget_password_sendPswrd": "Send Password Reset Email"
};
static const Map<String,dynamic> tr = {
  "language": "Türkçe",
  "helloWord": "Hello Word",
  "forget_password_reset": "Password reset email sent successfully.",
  "forget_password_forgot_title": "Forgot Password Page",
  "forget_password_enterEmail": "Enter your email and we'll send you a password reset link.",
  "forget_password_enterHere": "Enter your email here.",
  "forget_password_sendPswrd": "Send Password Reset Email"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en, "tr": tr};
}
