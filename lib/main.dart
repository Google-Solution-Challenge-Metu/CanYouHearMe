import 'package:dietapp/screens/home/donation/helpbox/cart_model.dart';
import 'package:dietapp/screens/login/auth_login.dart';
import 'package:dietapp/screens/login/service/login_service.dart';
import 'package:dietapp/wearOS_module/wear_intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_options.dart';

int? initScreen = 0;

void printData(){
  print("printle **************3131313131313131313313131131313131313");
}

/*void callbackDispatcherr(){
  Workmanager().executeTask((taskName,inputData){
    switch(taskName){
      case 'toFirebase':
        break;
      case 'print':
        printData();
        break;
      default:
    }
    return Future.value(true);
  });
}*/

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print("Native called background task: **********************"); //simpleTask will be emitted here.
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt("initScreen");
  await preferences.setInt("initScreen", 100);
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
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Color(0xffff7800)),
        ),
        debugShowCheckedModeBanner: false,
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
