import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/controller/controller.dart';
import 'package:dietapp/screens/home/donation/donation_main.dart';
import 'package:dietapp/screens/home/makeyourvoiceheard/home_page.dart';
import 'package:dietapp/screens/home/maps/map_custom.dart';
import 'package:dietapp/screens/home/volunteer/volunteer.dart';
import 'package:dietapp/screens/profile/profile_screen.dart';
import 'package:dietapp/screens/explore/explore.dart';
import 'package:dietapp/screens/profile/sos_rev.dart';
import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  double _latitude = 36.2025833;
  double _longitude = 36.1604033, distance=0, _earthltt=0, _earthlgt=0;

  late LatLng _currentPostion = LatLng(38.9637, 35.2433);
  late GeoPoint _EarthPostion = GeoPoint(36.2025833, 36.1604033);

  FirebaseDocument() async {
    var document = await db.collection('EarthquakeLocation').doc("s8t9yU5SmtrKK8BWw7kr").get();
    Map<String, dynamic>? value = document.data();
    if (this.mounted) {
      setState(() {
        _EarthPostion = value!['Hatay'];
        _earthltt= _EarthPostion.latitude;
        _earthlgt= _EarthPostion.longitude;
      });
    }
  }

  double EvalDistance(_latitude,_longitude, _earthltt, _earthlgt){
    double dst=sqrt((_earthltt-_latitude)*(_earthltt-_latitude)+(_earthlgt-_longitude)*(_earthlgt-_longitude));
    print("$_latitude $_longitude $_earthltt $_earthlgt $dst *********************************");
    return dst;
  }

  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

    setState(() {
      _currentPostion = LatLng(position.latitude, position.longitude);
      _latitude = position.latitude;
      _longitude = position.longitude;
    });
  }

  void initState() {
    _getUserLocation();
    FirebaseDocument();
    super.initState();
  }

  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      if(EvalDistance(_latitude, _longitude, _earthltt, _earthlgt)>1){
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [MakeYourVoiceHeardPage(),MapUIcustom(), VolunteerScreen(),DonationMainScreen(), ExploreScreen()],
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
                  icon: Icons.home,
                  text: "MYVH",
                ),
                GButton(
                  icon: Icons.map,
                  text: "Maps",
                ),
                GButton(
                  icon: Icons.handshake_outlined ,
                  text: "Volunteer",
                ),
                GButton(
                  icon: Icons.hotel_class_outlined,
                  text: "Donate",
                ),
                GButton(
                  icon: Icons.search,
                  text: "Explore",
                ),
              ],
            ),
          ),
        ),
      );}else{
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
      }
    });
  }
}
