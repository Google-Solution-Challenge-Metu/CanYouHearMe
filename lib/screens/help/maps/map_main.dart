import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_maps_controller/google_maps_controller.dart';

class MapUI extends StatefulWidget {
  @override
  State<MapUI> createState() => _MapUIState();
}

class _MapUIState extends State<MapUI> {

  // variables
  bool mapToggle = false;
  var currentLocation;
  late GoogleMapController mapController;
  //var clients=[];
  List<Marker> _markers = [];


  void initState(){
    super.initState();
    Geolocator.getCurrentPosition().then((currloc){
      setState(() {
        currentLocation=currloc;
        mapToggle=true;
        populateClients();
      });
    });
  }

  populateClients(){
    //clients=[];
    FirebaseFirestore.instance.collection("markers").get().then((docs){
      if(docs.docs.isNotEmpty){
        for(int i=0; i<docs.docs.length; ++i){
          //clients.add(docs.docs[i].data);
          initMarker(docs.docs[i].data,i);
        }
      }
    });
  }
  clearMarkers(){
    setState(() {
    _markers.clear();
  });
  }

  initMarker(client,i){
    //clearMarkers();
    _markers.add(
      Marker(
        markerId: MarkerId("$i"),
        position: LatLng(client()['location'].latitude,client()['location'].longitude),
        draggable: false,
        infoWindow: InfoWindow(title: client()['clientName'],snippet: "$i"),
      )
    );
    print(_markers.length);
    print(client()['clientName']);
    print("Success");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF4E6C50),
          title: const Text("Maps"),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 80.0,
                  width: double.infinity,
                  child: mapToggle
                  ?GoogleMap(
                    markers: Set<Marker>.from(_markers),
                    onMapCreated: onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(37.5753, 36.9228), //LatLng(currentLocation.latitude, currentLocation.longitude),   //For Current Location
                      zoom: 7.0
                    ),
                  ):
                  Center(child: 
                  Text("Loading ...",
                  style: TextStyle(fontSize: 20.0),))
                )
              ],
            )
          ],
        )
    );
  }
  void onMapCreated(controller){
    setState(() {
      mapController=controller;
    });
  }
}