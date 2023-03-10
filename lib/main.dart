import 'package:dietapp/screens/home/donation/helpbox/cart_model.dart';
import 'package:dietapp/screens/login/auth_login.dart';
import 'package:dietapp/screens/login/service/login_service.dart';
import 'package:dietapp/wearOS_module/wear_intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseUserAuthentication>(
            create: (_) => FirebaseUserAuthentication(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) =>
              context.read<FirebaseUserAuthentication>().authState,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: MaterialApp(
        initialRoute: "/",
        home: Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 300) {
                return Intro_Wear();
              } else {
                return AuthPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
