import 'package:flutter/material.dart';

class PatientLoginPage extends StatefulWidget {
  @override
  State<PatientLoginPage> createState() => _PatientLoginPageState();
}

class _PatientLoginPageState extends State<PatientLoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[600],
        body: SafeArea(
          child: Center(
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
                  ),
                ),
                buildTextField("Kullanıcı Adı"),
                const SizedBox(
                  height: 20.0,
                ),
                buildTextField("Şifre"),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Container(
                    width: 150.0,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Center(
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Container buildTextField(String hintText) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      width: 350.0,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
