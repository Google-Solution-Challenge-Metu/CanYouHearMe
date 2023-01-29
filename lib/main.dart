import 'package:dietapp/screens/homepage/home_page.dart';
import 'package:dietapp/screens/login/login_doctor.dart';
import 'package:dietapp/screens/login/login_patient.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[600],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/mithat.jpg"),
              ),
              const Text(
                "Diet-App",
                style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "to eat or not to eat",
                style: TextStyle(
                  fontFamily: "Source Sans Pro",
                  fontSize: 15.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[100],
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.white,
                  thickness: 3.0,
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.personal_injury,
                      color: Colors.green,
                    ),
                    title: const Text(
                      "Hasta Girişi",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    trailing: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientLoginPage()));
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.medical_services,
                      color: Colors.green,
                    ),
                    title: const Text(
                      "Doktor Girişi",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    trailing: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorLoginPage()));
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
