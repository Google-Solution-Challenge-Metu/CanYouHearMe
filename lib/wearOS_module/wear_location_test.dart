import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/wearOS_module/wear_services/wear_report_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'wear_sos.dart';


class MapWear extends StatefulWidget {
  const MapWear({Key? key}) : super(key: key);

  @override
  State<MapWear> createState() => MapWearState();
}

class MapWearState extends State<MapWear> {
  static double _latitude = 0;
  static double _longitude = 0;
  static LatLng last_latLng=LatLng(38.9637, 35.2433);

  Completer<GoogleMapController> _controller = Completer();

  List<Marker> one_marker=[];
  List<LatLng> coordinates=[];
  Set<Polyline> _polylines =Set<Polyline>();

  double _zoom = 15.0;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(38.9637, 35.2433),
    zoom: 5.0,
  );
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
            "Sending a sos call",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      }
    );
  }
  
  void warnmes(BuildContext context) {
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
        Navigator.pop(context);
        
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(237, 233, 125, 71),
      content: Container(
        width: MediaQuery.of(context).size.width-20,
        height: MediaQuery.of(context).size.height-20,),
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

  Future<void> SendSosMessage() async {
    FirebaseDocument();

    _reportService
        .addStatus("Help Me Please", 
                  (name+" "+surname),
                  GeoPoint(_latitude, _longitude),
        ).then((value) {
          SOSsent();
    });
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
           myLocationEnabled: true,
           myLocationButtonEnabled: true ,
           onTap: (LatLng latlng){
             Marker onemarker= Marker(
               markerId: MarkerId(""),
               position: latlng,
               infoWindow: InfoWindow(title: "I'm here"),
               icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
             );
             one_marker.add(onemarker);
             setState(() {
               last_latLng=latlng;
             });
             print(latlng);
           },
           initialCameraPosition: _kGooglePlex,
           onMapCreated: (GoogleMapController controller){
             _controller.complete(controller);
           },  //
           markers: one_marker.map((e) => e).toSet(),
           polylines: _polylines,
         ),
         Container(
          padding: EdgeInsets.only(top:24,right:12),
          alignment: Alignment.topRight,
          child: Column(
            children: <Widget>[
              FloatingActionButton.small(
                backgroundColor: const Color(0xffe97d47),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return sos_page();
                    },
                  ),
                ),
                child: Icon(Icons.arrow_back_outlined),)
            ],
          ),
        )
        ],
      //  child: Container(
      //    height: MediaQuery.of(context).size.height,
      //    width: MediaQuery.of(context).size.width,
      //    child: Column(
      //      children: [
      //        Expanded(
      //          child: GoogleMap(
      //            myLocationEnabled: true,
      //            myLocationButtonEnabled: true ,
      //            onTap: (LatLng latlng){
      //              Marker onemarker= Marker(
      //                markerId: MarkerId(""),
      //                position: latlng,
      //                infoWindow: InfoWindow(title: "I'm here"),
      //                icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      //              );
      //              one_marker.add(onemarker);
      //              setState(() {
      //                last_latLng=latlng;
      //              });
      //              print(latlng);
      //            },
      //            initialCameraPosition: _kGooglePlex,
      //            onMapCreated: (GoogleMapController controller){
      //              _controller.complete(controller);
      //            },  //
      //            markers: one_marker.map((e) => e).toSet(),
      //            polylines: _polylines,
      //          ),
      //        ),
      //        Container(
      //          padding: EdgeInsets.only(top:24,right:12),
      //          alignment: Alignment.topRight,
      //          child: Column(
      //            children: <Widget>[
      //              FloatingActionButton(
      //                backgroundColor: const Color(0xffe97d47),
      //                onPressed: null,
      //                child: Icon(Icons.arrow_back),)
      //            ],
      //          ),
      //        )
      //      ],
      //    ),
      //  )
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          setState(() {
            _latitude = last_latLng.latitude;
            _longitude = last_latLng.longitude;
          });
          print(last_latLng);
          FirebaseDocument();
          warnmes(context);
          
          
        },
        icon: Icon(Icons.add_location),
        label: const Text("Set"),
        backgroundColor: const Color(0xffe97d47),
      ),
    );
  }
}