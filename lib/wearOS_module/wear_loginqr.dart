import 'package:dietapp/wearOS_module/wear_intro.dart';
import 'package:dietapp/wearOS_module/wear_sos.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class loginQR extends StatefulWidget {
  const loginQR({super.key});

  @override
  State<loginQR> createState() => _loginQRState();
}

class _loginQRState extends State<loginQR> {
  @override

   // Create unique id for login 
   String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
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
                    'assets/images/outline_arrow.png',
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
                    return Intro_Wear();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
                height: 0,
              ),
          QrImage(
            data: idGenerator(),
            size: 149,
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: const Size(
                100,
                100,
              ),
            ),
          ),
          const SizedBox(
                height: 0,
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
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 222, 91, 91),
                ),
                child: const Text(
                  "LogIn",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ), 
          ]
        )
      )
    );
  }
}