import 'package:dietapp/onboardingscreen.dart';
import 'package:dietapp/wearOS_module/wear_location_test.dart';
import 'package:dietapp/wearOS_module/wear_login.dart';
import 'package:dietapp/wearOS_module/wear_sos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dietapp/routes/routes.dart';

class Wear_Auth extends StatelessWidget {
  const Wear_Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return sos_page();
            } else {
              return wear_login();
            }
          },
        ),
      ),
    );
  }
}
