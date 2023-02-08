import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        wrongEmailMessage();
      } else if (e.code == "wrong-password") {
        wrongPasswordMessage();
      } else {
        nothingMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Wrong email."),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Wrong email."),
        );
      },
    );
  }

  void nothingMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("No email, password or both."),
        );
      },
    );
  }

  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF4E6C50),
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
                  "Can You Hear Me?",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "to save someone from the earthquake",
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
                buildTextField(emailController, "E-mail", false),
                const SizedBox(
                  height: 20.0,
                ),
                buildTextField(passwordController, "Password", true),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Şifrenizi mi unuttunuz?",
                        style: TextStyle(color: Colors.grey.shade200),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                buildButton(signUserIn),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Veya şununla devam edin",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 50.0,
                      child: Image.asset("assets/images/google.png"),
                    )
                  ],
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
                    GestureDetector(
                      onTap: registerUser,
                      child: const Text(
                        " Kaydol",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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

  Padding buildButton(Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          width: 150.0,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: const Color(0xFF698269),
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
    );
  }

  Padding buildTextField(final controller, String hintText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
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
