import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUI extends StatefulWidget {
  @override
  State<MapUI> createState() => _MapUIState();
}

class _MapUIState extends State<MapUI> {

  bool mapToggle = false;
  var currentLocation;
  late GoogleMapController mapController;

  void initState(){
    super.initState();
    Geolocator.getCurrentPosition().then((currloc){
      setState(() {
        currentLocation=currloc;
        mapToggle=true;
      });
    });}
  

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
                    onMapCreated: onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(36.2023, 36.1613), //LatLng(currentLocation.latitude, currentLocation.longitude),   //For Current Location
                      zoom: 6.0
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