import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class LocationPicker extends StatefulWidget {
  const LocationPicker({Key? key}) : super(key: key);

  @override
  State<LocationPicker> createState() => LocationPickerState();
}

class LocationPickerState extends State<LocationPicker> {
  static double latitude = 0;
  static double longitude = 0;
  static String address="";

  Completer<GoogleMapController> _controller = Completer();

  LatLng _latLng = LatLng(28.7041, 77.1025);
  double _zoom = 15.0;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.7041, 77.1025),
    zoom: 15.0,
  );

  Future<Position> getUserCurrentPosition()async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      print("error:"+error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe97d47),
        title: const Text("Pick Your Location",style: TextStyle(color: Colors.white),),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Geolocator.getCurrentPosition().then((value){
            setState(() {
              latitude =value.latitude;
              longitude =value.longitude;
            });
            print(latitude.toString()+" "+longitude.toString());
          });
        },
        child: Icon(Icons.add_location),
      ),
    );
  }
}