import 'package:dietapp/screens/home/donation/helpbox/cart_model.dart';
import 'package:dietapp/screens/login/auth_login.dart';
import 'package:dietapp/screens/login/service/login_service.dart';
import 'package:dietapp/translations/codegen_loader.g.dart';
import 'package:dietapp/wearOS_module/wear_intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

int? initScreen = 0;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt("initScreen");
  await preferences.setInt("initScreen", 100);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'),
                        Locale('tr'),
                        Locale('ar')],
      path: 'assets/translations', 
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp()
    ),);
}

class MyApp extends StatelessWidget {
  
  Locale? _locale;

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
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Color(0xffff7800)),
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
