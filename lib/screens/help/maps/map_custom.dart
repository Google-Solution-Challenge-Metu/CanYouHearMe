import 'dart:ffi';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_maps_controller/google_maps_controller.dart';

class MapUIcustom extends StatefulWidget {
  @override
  State<MapUIcustom> createState() => _MapUIStatecustom();
}

class _MapUIStatecustom extends State<MapUIcustom> {
    CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final LatLng _latLng = LatLng(28.7041, 77.1025);
  final double _zoom = 15.0;

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData() ;

  }  

  Set<Marker> _markers = {};
  List<LatLng> _latLang = <LatLng> [
    LatLng(38.4237, 27.1428),LatLng(41.0082, 28.9784)
  ];  

  loadData(){
  for(int i=0; i<_latLang.length; ++i){
    _markers.add(
      Marker(
        markerId: MarkerId("$i"),
        position: _latLang[i],
        infoWindow: InfoWindow(title: "$i"),
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://www.ekoiq.com/wp-content/uploads/2023/02/deprem-12-1200x700.jpg"),
                        fit: BoxFit.fitWidth,
                        filterQuality: FilterQuality.high),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.red
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "$i",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        const Spacer(),
                        Text("sa")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
                    child: Text("Ya devlet başa ya kuzgun leşe", 
                    maxLines: 2, )
                  )
                ],
              ),
            ),
            _latLang[i],
          );
        },
      ),
    );
    setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Info Window Example'),
        backgroundColor: Color.fromARGB(255, 118, 92, 126),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
            },
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.5753, 36.9228),
              zoom: 4,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            offset: 35,
          ),
        ],
      ),
    );
  }
}
//  // variables
//  //late GoogleMapController mapController;
//  CustomInfoWindowController _customInfoWindowController=
//  CustomInfoWindowController();
//  bool mapToggle = false;
//  var currentLocation;
//  
//  List<Marker> _markers = [];
//  List<LatLng> _latLang = <LatLng> [
//    LatLng(38.4237, 27.1428),LatLng(41.0082, 28.9784)
//  ];
//
//
//void initState(){
//    super.initState();
//    Geolocator.getCurrentPosition().then((currloc){
//      setState(() {
//        currentLocation=currloc;
//        mapToggle=true;
//        populateClients();
//      });
//    });
//  }
//
//  populateClients(){
//    //clients=[];
//   
//    for(int i=0; i<_latLang.length; ++i){
//      //clients.add(docs.docs[i].data);
//      _markers.add(
//      Marker(
//        markerId: MarkerId("$i"),
//        position: _latLang[i],
//        draggable: false,
//        onTap: () {
//          _customInfoWindowController.addInfoWindow!(
//            Text("data"),
//            _latLang[i]
//          );
//        }
//      )
//      );
//        }
//      
//    
//  }
//  clearMarkers(){
//    setState(() {
//    _markers.clear();
//  });
//  }
//
//  initMarker(client,i){
//    //clearMarkers();
//    _markers.add(
//      Marker(
//        markerId: MarkerId("$i"),
//        position: client,
//        draggable: false,
//        onTap: () {
//          _customInfoWindowController.addInfoWindow!(
//            Text("data"),
//            client
//          );
//        }
//      )
//    );
//    print(_markers.length);
//    print("Success");
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//          backgroundColor: Color.fromARGB(255, 108, 78, 98),
//          title: const Text("Maps"),
//        ),
//        body: Column(
//          children: [
//            Stack(
//              children: [
//                mapToggle
//                  ?GoogleMap(
//                    initialCameraPosition: CameraPosition(
//                      target: LatLng(37.5753, 36.9228), //LatLng(currentLocation.latitude, currentLocation.longitude),   //For Current Location
//                      zoom: 4.0
//                    ),
//                    markers: Set<Marker>.of(_markers),
//                    onMapCreated: (GoogleMapController controller){
//                      _customInfoWindowController.googleMapController =controller;},
//                  ):
//                  Center(child: 
//                  Text("Loading ...",
//                  style: TextStyle(fontSize: 20.0),)),
//                CustomInfoWindow(
//                  controller: _customInfoWindowController,
//                  height: 200,
//                  width: 300,
//                  offset: 35,
//                  )
//              ]
//            )
//          ],
//        )   
//    );
//  }
//  void onMapCreated(controller){
//    setState(() {
//      null;
//      //mapController=controller;
//    });
//  }
//}