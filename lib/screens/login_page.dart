import 'package:dietapp/screens/forgot_password.dart';
import 'package:dietapp/screens/register_page.dart';
import 'package:dietapp/services/auth_service.dart';
import 'package:dietapp/screens/login/service/login_service.dart';
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
  int play_pause = 0;
  final player = AudioPlayer();

  void sos_warning() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color(0xffe97d47),
          title: Text(
            "Turn Up Your Phone Volume! To Pause The Sound, Please Press The Button Again.",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  void registerUser() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                // autogroupe2pp7c9 (57P22SfybUb95vsn6xE2PP)
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 19),
                width: double.infinity,
                height: height * 0.32,
                decoration: const BoxDecoration(
                  color: Color(0xffe97d47),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: height * 0.17,
                          height: height * 0.17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * 0.10),
                            color: const Color(0xffffffff),
                            image: const DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage("assets/images/ring.png"),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (play_pause == 0) {
                                player.play(AssetSource("sossound.mp3"));
                                //player.stop();
                                sos_warning();
                                setState(() {
                                  play_pause = 1;
                                  print(play_pause);
                                });
                              } else {
                                player.stop();
                                setState(() {
                                  play_pause = 0;
                                  print(play_pause);
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ])),
            const Text(
              "Can You Hear Me?",
              style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 30.0,
                  color: Color(0xffe97d47),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Login Page",
              style: TextStyle(
                fontFamily: "Source Sans Pro",
                fontSize: 15.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 174, 174),
              ),
            ),
            SizedBox(
              height: 30.0,
              width: 200.0,
              child: Divider(
                color: Colors.grey.shade200,
                thickness: 1.0,
              ),
            ),
            buildTextField(Icons.email, emailController, "E-mail", false),
            const SizedBox(
              height: 20.0,
            ),
            buildTextField(Icons.lock, passwordController, "Password", true),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage())),
                    child: const Text(
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
            buildButton(() async {
              await FirebaseUserAuthentication.signIn(
                email: emailController.text,
                password: passwordController.text,
                context: context,
              );
            }),
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
                      "or continue with",
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
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
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
              color: const Color(0xffe97d47),
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

  Padding buildTextField(
      IconData icon, final controller, String hintText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[500]),
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
