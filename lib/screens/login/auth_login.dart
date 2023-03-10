import 'package:dietapp/screens/onboardingscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dietapp/screens/login/service/login_service.dart';
import 'package:get/get.dart';
import 'package:dietapp/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../navbar/navbar.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GetMaterialApp(
              initialRoute: AppPage.getNavBar(),
              getPages: AppPage.routes,
            );
          } else {
            return OnBoardingScreen();
          }
        },
      ),
    );
  }
}
