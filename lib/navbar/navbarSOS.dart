import 'package:dietapp/controller/controller.dart';
import 'package:dietapp/screens/home/donation/donation_main.dart';
import 'package:dietapp/screens/home/makeyourvoiceheard/home_page.dart';
import 'package:dietapp/screens/home/maps/map_custom.dart';
import 'package:dietapp/screens/home/volunteer/volunteer.dart';
import 'package:dietapp/screens/profile/profile_screen.dart';
import 'package:dietapp/screens/explore/explore.dart';
import 'package:dietapp/screens/profile/sos_rev.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controller/controller_sos.dart';

class NavBarSOS extends StatefulWidget {
  const NavBarSOS({Key? key}) : super(key: key);
  @override
  State<NavBarSOS> createState() => _NavBarSOSState();
}

class _NavBarSOSState extends State<NavBarSOS> {
  final controller = Get.put(NavBarControllerSos());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarControllerSos>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [SosRev(), MapUIcustom(), MakeYourVoiceHeardPage(), VolunteerScreen(),DonationMainScreen()],
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
                  icon: Icons.alarm,
                  text: "SOS",
                ),
                GButton(
                  icon: Icons.map,
                  text: "Maps",
                ),
                GButton(
                  icon: Icons.home,
                  text: "MYVH",
                ),
                GButton(
                  icon: Icons.handshake_outlined ,
                  text: "Volunteer",
                ),
                GButton(
                  icon: Icons.hotel_class_outlined,
                  text: "Donate",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
