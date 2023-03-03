import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/wearOS_module/wear_services/wear_report_service.dart';
import 'package:dietapp/wearOS_module/wear_devices.dart';
import 'package:dietapp/wearOS_module/wear_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'wear_intro.dart';
import 'package:geolocator/geolocator.dart';


class sos_page extends StatefulWidget {
  const sos_page({super.key});

  @override
  State<sos_page> createState() => _sos_pageState();
}

class _sos_pageState extends State<sos_page> {
  final SOSReportService _reportService = SOSReportService();
  var currentLocation;
  late bool serviceEnabled;
  late LocationPermission permission;
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String name = "";
  String surname = "";

  FirebaseDocument() async {
    var document = await db.collection('Person').doc(user.uid).get();
    Map<String, dynamic>? value = document.data();
    setState(() {
      name = value!['name'];
      surname = value['surname'];
      print(name);
    });
  }  
  void warnmes() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromARGB(255, 130, 0, 0),
          title: Text(
            "Sending a sos call...",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
  Future AskPer() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
  
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
  
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }  

  }
  void SendSosMessage(){
    //AskPer();
    //Geolocator.getCurrentPosition().then((currloc){
    //  setState(() {
    //    currentLocation=currloc;});});
    //print(currentLocation);
    FirebaseDocument();
    _reportService
        .addStatus("Help Me Please", 
                  (name+" "+surname),
        ).then((value) {
          warnmes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Color.fromARGB(255, 245, 203, 141),
            ],
            stops: [0.05,1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/profile_black.png',
                    height: 23,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Wear_Profile();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
                height: 20,
              ),
          GestureDetector(
              onTap: () {
                warnmes();
                SendSosMessage();
              },
              child: Image.asset(
                'assets/images/sosbuttontrans.png',
                height: 100,
              ),  
            ),
          const SizedBox(
                height: 29,
              ),  
          GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return devices_page();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 222, 91, 91),
                ),
                child: const Text(
                  "Find Device",
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),  

          ],
        ),
        
      ),

    );
  }
}