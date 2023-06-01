import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/screens/login/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:dietapp/routes/routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});



  @override
  State<AuthPage> createState() => _AuthPageState();
}

  

class _AuthPageState extends State<AuthPage> {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  double _latitude = 0;
  double _longitude = 0, distance=0, _earthltt=0, _earthlgt=0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(EvalDistance(_latitude, _longitude, _earthltt, _earthlgt)>1){
              return GetMaterialApp(
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Color(0xffff7800)),
                ),
                debugShowCheckedModeBanner: false,
                initialRoute: AppPage.getNavBar(EvalDistance(_latitude, _longitude, _earthltt, _earthlgt)),
                getPages: AppPage.routes,
              );
            }else{
              print("SOSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
              return GetMaterialApp(
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: Color(0xffff7800)),
                ),
                debugShowCheckedModeBanner: false,
                initialRoute: AppPage.getNavBar(EvalDistance(_latitude, _longitude, _earthltt, _earthlgt)),
                getPages: AppPage.routes,
              );
            }
          } else {
            return Splash();
          }
        },
      ),
    );
  }
}
