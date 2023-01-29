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
                  height: 30.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.white,
                    thickness: 3.0,
                  ),
                ),
                buildTextField("Kullanıcı Adı", false),
                const SizedBox(
                  height: 20.0,
                ),
                buildTextField("Şifre", true),
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
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kayıtlı değil misin?",
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    const Text(
                      " Kaydol",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Padding buildTextField(String hintText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
