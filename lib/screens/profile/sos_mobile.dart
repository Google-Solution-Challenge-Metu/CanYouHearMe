import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/services/sos_mobile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SosMobile extends StatefulWidget {
  const SosMobile({super.key});

  @override
  State<SosMobile> createState() => _SosMobileState();
}


class _SosMobileState extends State<SosMobile> {

  static double? _latitude;
  static double? _longitude;
  static LatLng? last_latLng;
  final SosMobileService _reportService = SosMobileService();
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
            "Sending a sos call",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      }
    );
  }

  void warnmes(BuildContext context,_latitude,_longitude) {
    FirebaseDocument();
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 24),),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();    
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 24),),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();   
        SendSosMessage(_latitude,_longitude);
        Navigator.pop(context);
        
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(237, 233, 125, 71),
      content: Container(
        width: MediaQuery.of(context).size.width-20,
        height: MediaQuery.of(context).size.height/8,),
      title: Text(
        "Sending a sos call, are you sure?",
        style: TextStyle(color: Colors.white, fontSize: 24),
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


  Future<void> SendSosMessage(_latitude,_longitude) async {
    FirebaseDocument();
  
    _reportService
        .addStatus("Help Me Please!!", 
                  (name+" "+surname),
                  GeoPoint(_latitude, _longitude),
        ).then((value) {
          SOSsent();
    });
  
  }

  Future<Position> _getCurrentLocation() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("Location services are disabled.");
    }
    LocationPermission permission =await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission= await Geolocator.requestPermission();
      if (permission==LocationPermission.denied){
        return Future.error("Location services are disabled.");
      }
    }
    if(permission==LocationPermission.deniedForever){
      return Future.error("Location services are permanently disabled.");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("SOS Button",style: TextStyle(color: Color(0xffe97d47)),),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xffe97d47),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context, 
                    builder: (context)=> SimpleDialog(
                      title: const Text("SOS Button"),
                      contentPadding: const EdgeInsets.all(20.0),
                      children: [
                        const Text("Use when needed!"),
                        TextButton(
                          onPressed:() {
                            Navigator.of(context).pop();
                          }, 
                          child: const Text("Close", style: TextStyle(color:Color(0xffe97d47) ),),
                        )
                      ],

                    )
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  color: Color(0xffe97d47),
                ),
              ),
            )
          ],
      ),
    body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60*MediaQuery.of(context).size.width),
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
                    _getCurrentLocation().then((value) {
                      setState(() {
                        _latitude=value.latitude;
                        _longitude=value.longitude;
                        print(_latitude);
                        //last_latLng=LatLng(_latitude, _longitude);
                      });
                    },);
                    //print(last_latLng);
                    FirebaseDocument();
                    warnmes(context,_latitude,_longitude);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}