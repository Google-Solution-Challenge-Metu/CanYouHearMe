import 'package:dietapp/screens/register_page.dart';
import 'package:dietapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
          backgroundColor: Color.fromARGB(255, 130, 0, 0),
          title: Text(
            "Incorrect email.",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromARGB(255, 130, 0, 0),
          title: Text(
            "Incorrect password.",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void nothingMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromARGB(255, 130, 0, 0),
          title: Text(
            "No email, password or both.",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void sos_warning() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromARGB(255, 130, 0, 0),
          title: Text(
            "Turn Up Your Phone Volume!",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void registerUser() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // autogroupe2pp7c9 (57P22SfybUb95vsn6xE2PP)
                margin:  EdgeInsets.fromLTRB(0, 0, 0, 19),
                width:  double.infinity,
                height:  207,
                decoration:  BoxDecoration (
                  color:  Color(0xffe97d47),
                  borderRadius:  BorderRadius.circular(25),
                ),
                child:  
              Column(
                children:  [
                  SizedBox(height:50.0),
                  Container(
                    width: 100,
                    height: 100,
                    decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(50),
                      color:  Color(0xffffffff),
                      image: DecorationImage(
                          image: AssetImage("assets/images/ring.png"),
                        ),
                      boxShadow:  [
                        BoxShadow(
                          color:  Color(0x3f000000),
                          offset:  Offset(0, 4),
                          blurRadius:  2,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        final player = AudioCache();
                        player.play("sossound.mp3");
                        sos_warning();
                      },
                    ),
                  ),        
                ]
              )
            ),
              
              const Divider(),
              const Text(
                "LOG IN",
                style: TextStyle(
                    fontFamily: "GoogleFonts",
                    fontSize: 30.0,
                    color: Color(0xffe97d47),
                    fontWeight: FontWeight.bold),
              ),
              //const Text(
              //  "To Save Someone From The Earthquake",
              //  style: TextStyle(
              //    fontFamily: "Source Sans Pro",
              //    fontSize: 15.0,
              //    letterSpacing: 2.5,
              //    fontWeight: FontWeight.bold,
              //    color: Color.fromARGB(255, 255, 174, 174),
              //  ),
              //),
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
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Color(0xffe97d47)),
                      ),
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
                        "Or",
                        style: TextStyle(
                          color: Color(0xffe97d47),
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
                  GestureDetector(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Container(
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
                    ),
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
                    "Don’t have an account?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  GestureDetector(
                    onTap: registerUser,
                    child: const Text(
                      " Sign Up",
                      style: TextStyle(
                        color: Color(0xffe97d47),
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
              color: Color(0xffe97d47),
              borderRadius: BorderRadius.circular(12.0)),
          child: const Center(
            child: Text(
              "Login",
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
