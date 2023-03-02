import 'package:dietapp/screens/home/volunteer/glassbox.dart';
import "package:flutter/material.dart";

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});
  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4E6C50),
        title: Text("Let's Help!"),
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // Import image in pubspec.yaml first
            image: AssetImage('assets/images/Colorcard-hex_820000.png'),
            // BoxFit.cover scales up the image until it completely covers the screen
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FrostedGlassBox(
                  theWidth: 350.0, theHeight: 200.0, theChild: Text("data")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FrostedGlassBox(
                  theWidth: 350.0, theHeight: 200.0, theChild: Text("data")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FrostedGlassBox(
                  theWidth: 350.0, theHeight: 200.0, theChild: Text("data")),
            ),
          ],
        ),
      ),
    );
  }
}
