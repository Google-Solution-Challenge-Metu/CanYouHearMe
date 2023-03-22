import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Future sendResetEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          backgroundColor: Color(0xffe97d47),
          content: Text(
            "Password reset email sent successfully.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xffe97d47),
          content: Text(
            e.message.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffe97d47),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 50.0, left: 30.0, right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Can You Hear Me?",
                    style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 30.0,
                        color: Color(0xffe97d47),
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Forgot Password Page",
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
                      thickness: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Text(
                          "Enter your email and we'll send you a password reset link.",
                          style: TextStyle(
                            fontFamily: "Source Sans Pro",
                            fontSize: 16.0,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(Icons.email, emailController,
                      "Enter your email here.", false),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildButton(sendResetEmail),
                ],
              ),
            ),
          ],
        ),
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
          width: 250.0,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: const Color(0xffe97d47),
              borderRadius: BorderRadius.circular(12.0)),
          child: const Center(
            child: Text(
              "Send Password Reset Email",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField buildTextField(
      IconData icon, final controller, String hintText, bool obscureText) {
    return TextField(
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
    );
  }
}
