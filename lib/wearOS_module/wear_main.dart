import 'package:dietapp/wearOS_module/wear_intro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PartlyWindy());
}

class PartlyWindy extends StatelessWidget {
  const PartlyWindy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WearOS',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Intro_Wear(),
    );
  }
}
