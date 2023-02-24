import 'package:flutter/material.dart';
import 'package:wearos/devices.dart';

import 'intro.dart';

class sos_page extends StatefulWidget {
  const sos_page({super.key});

  @override
  State<sos_page> createState() => _sos_pageState();
}

class _sos_pageState extends State<sos_page> {

  void warnmes() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromARGB(255, 130, 0, 0),
          title: Text(
            "Sending a sos call...",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/outline_arrow.png',
                    height: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Back',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Intro_page();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
                height: 20,
              ),
          GestureDetector(
              onTap: () {
                warnmes();
              },
              child: Image.asset(
                'assets/sosbuttontrans.png',
                height: 100,
              ),  
            ),
          const SizedBox(
                height: 29,
              ),  
          GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return devices_page();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 222, 91, 91),
                ),
                child: const Text(
                  "Find Device",
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