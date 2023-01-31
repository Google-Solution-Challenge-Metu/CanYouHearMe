import 'package:dietapp/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text("Home"),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: GNav(
            backgroundColor: Colors.green,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.green.shade700,
            gap: 10.0,
            padding: const EdgeInsets.all(16.0),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Ana Sayfa",
              ),
              GButton(
                icon: Icons.favorite_border,
                text: "Sosyal Medya",
              ),
              GButton(
                icon: Icons.search,
                text: "Keşfet",
              ),
              GButton(
                icon: Icons.person,
                text: "Profil",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
