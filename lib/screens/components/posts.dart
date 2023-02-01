import 'package:flutter/material.dart';

class PostBuilder extends StatelessWidget {
  final List<String> userPosts = [];

  PostBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: Colors.green[300],
      ),
    );
  }
}
