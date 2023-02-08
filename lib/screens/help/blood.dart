import "package:flutter/material.dart";

class BloodScreen extends StatefulWidget {
  const BloodScreen({super.key});
  @override
  State<BloodScreen> createState() => _BloodScreenState();
}

class _BloodScreenState extends State<BloodScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Blood"),
      ),
    );
  }
}
