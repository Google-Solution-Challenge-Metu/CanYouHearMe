import "package:flutter/material.dart";

class BoxScreen extends StatefulWidget {
  const BoxScreen({super.key});
  @override
  State<BoxScreen> createState() => _BoxScreenState();
}

class _BoxScreenState extends State<BoxScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("HelpBox"),
      ),
    );
  }
}
