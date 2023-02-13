import 'package:dietapp/screens/homepage/post_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E6C50),
        title: const Text("HomePage"),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        // Go to CartPage
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PostPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
