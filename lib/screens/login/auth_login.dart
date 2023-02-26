import 'package:dietapp/onboardingscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dietapp/routes/routes.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: AppPage.getNavBar(),
                getPages: AppPage.routes,
              );
            } else {
              return const OnBoardingScreen();
            }
          },
        ),
      ),
    );
  }
}
