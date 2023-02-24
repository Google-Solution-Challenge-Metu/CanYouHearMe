import 'package:flutter/material.dart';
import 'package:wearos/intro.dart';

void main() {
  runApp(const PartlyWindy());
}

class PartlyWindy extends StatelessWidget {
  const PartlyWindy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partly Windy',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Intro_page(),
    );
  }
}
