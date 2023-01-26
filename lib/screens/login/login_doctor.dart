import 'package:flutter/material.dart';

class DoctorLoginPage extends StatefulWidget {
  @override
  State<DoctorLoginPage> createState() => _DoctorLoginPageState();
}

class _DoctorLoginPageState extends State<DoctorLoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[400],
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 20.0,
                width: 200.0,
              ),
              Center(
                child: Text(
                  "TYT-AYT Kartlar",
                  style: TextStyle(
                    fontFamily: "Source Sans Pro",
                    fontSize: 15.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[100],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: 200.0,
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.green,
                    ),
                    title: Text(
                      "TYT Kartlar",
                      style: TextStyle(
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
