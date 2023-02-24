import "package:flutter/material.dart";
import 'package:wearos/sos.dart';

class Intro_page extends StatefulWidget {
  const Intro_page({super.key});

  @override
  State<Intro_page> createState() => _Intro_pageState();
}

class _Intro_pageState extends State<Intro_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(
        centerTitle: true,
        
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Let's Start"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Color.fromARGB(255, 245, 203, 141),
            ],
            stops: [0.05,1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
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
                'assets/google.png',
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
                    return sos_page();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 222, 91, 91),
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