import 'package:dietapp/controller/controller.dart';
import 'package:dietapp/screens/home.dart';
import 'package:dietapp/screens/profile/profile_screen.dart';
import 'package:dietapp/screens/explore/explore.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [ExploreScreen(), HomeScreen(), ProfileScreen()],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: GNav(
              selectedIndex: controller.tabIndex,
              onTabChange: controller.changeTabIndex,
              backgroundColor: Colors.transparent,
              color: Colors.black,
              activeColor: Color(0xffe97d47),
              tabBackgroundColor: Color.fromARGB(43, 233, 125, 71),
              gap: 10.0,
              padding: const EdgeInsets.all(16.0),
              tabs: const [
                GButton(
                  icon: Icons.search,
                  text: "Explore",
                ),
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.person,
                  text: "My Profile",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
