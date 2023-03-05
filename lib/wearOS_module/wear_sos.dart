import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/wearOS_module/wear_location_test.dart';
import 'package:dietapp/wearOS_module/wear_services/wear_report_service.dart';
import 'package:dietapp/wearOS_module/wear_devices.dart';
import 'package:dietapp/wearOS_module/wear_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'wear_intro.dart';



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
  void SOSsent() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Color.fromARGB(148, 233, 125, 71),
          title: Text(
            "Sending a sos call, are you",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      }
    );
  }
  
  void warnmes(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => MapWear()));
    FirebaseDocument();
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel", style: TextStyle(color: Colors.white),),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();    
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue", style: TextStyle(color: Colors.white),),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();   
        SendSosMessage();
        
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xffe97d47),
      content: Container(
        width: MediaQuery.of(context).size.width-20,
        height: 50,),
      title: Text(
        "Sending a sos call, are you sure?",
        style: TextStyle(color: Colors.white, fontSize: 12),
        textAlign: TextAlign.center,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
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
  Future<void> SendSosMessage() async {
    //AskPer();
    //Geolocator.getCurrentPosition().then((currloc){
    //  setState(() {
    //    currentLocation=currloc;});});
    //print(currentLocation);
    
    FirebaseDocument();

    _reportService
        .addStatus("Help Me Please", 
                  (name+" "+surname),
                  GeoPoint(10, 10),
        ).then((value) {
          SOSsent();
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          //gradient: LinearGradient(
          //  colors: [
          //    Colors.orange,
          //    Color.fromARGB(255, 245, 203, 141),
          //  ],
          //  stops: [0.05,1],
          //  begin: Alignment.topCenter,
          //  end: Alignment.bottomCenter
          //)
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
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.w300,
                        color: Color(0xffe97d47)),
                    ),
                    
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
                height: 6,
              ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color(0xffffffff),
              image: const DecorationImage(
                image: AssetImage("assets/images/ring.png"),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffe97d47),
                  offset: Offset(0, 4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapWear()));
                  
                //warnmes(context);
                //SendSosMessage();
                //_getCurrentPosition();
              },
            ),
          ),

          const SizedBox(
                height: 19,
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
                  color: Color(0xffe97d47),
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