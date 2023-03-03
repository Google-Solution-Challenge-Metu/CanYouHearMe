import 'package:dietapp/wearOS_module/wear_auth.dart';
import 'package:dietapp/wearOS_module/wear_login.dart';
import 'package:dietapp/wearOS_module/wear_sos.dart';
import "package:flutter/material.dart";

class Intro_Wear extends StatefulWidget {
  const Intro_Wear({super.key});

  @override
  State<Intro_Wear> createState() => _Intro_WearState();
}

class _Intro_WearState extends State<Intro_Wear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        centerTitle: true,
        
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Let's Start",
          style: TextStyle(
            color: Color(0xffe97d47),
          ),
          ),
      ),
      body: Container(
        decoration: BoxDecoration(
          //gradient: LinearGradient(
          //  colors: [
          //    Colors.orange,
          //    Color.fromARGB(255, 245, 203, 141),
          //  ],
          //  stops: [0.05,1],
          //  begin: Alignment.topCenter,
          //  end: Alignment.bottomCenter
          //)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                top: 50,
                bottom: 0,
              ),
              child: Image.asset(
                'assets/images/hands.png',
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'This app is for emergency calls. Please use only when necessary.',
                textAlign: TextAlign.center,
                //style: GoogleFonts.notoSerif(
                //    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Wear_Auth();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xffe97d47),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        
      ),

    );
  }
}