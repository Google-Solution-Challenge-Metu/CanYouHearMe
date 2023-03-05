import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationTest extends StatefulWidget {
  const LocationTest({super.key});

  @override
  State<LocationTest> createState() => _LocationTestState();
}

Location location= new Location();
late bool _serviceEnabled;
late PermissionStatus _permissionGranted;
late LocationData _locationData;

Future<dynamic> getLocation() async{
  _serviceEnabled=await location.serviceEnabled();
  if(!_serviceEnabled) _serviceEnabled=await location.requestService();

  _permissionGranted=await location.hasPermission();
  if(_permissionGranted==PermissionStatus.denied){
    _permissionGranted=await location.requestPermission();
  }
  _locationData=await location.getLocation();
  return _locationData;
}

class _LocationTestState extends State<LocationTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: getLocation, 
          child: const Text('Enabled'),)
      ],
    );
  }
}