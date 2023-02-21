import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapPickerPage extends StatefulWidget {
  const MapPickerPage({Key? key}) : super(key: key);

  @override
  State<MapPickerPage> createState() => MapPickerPageState();
}

class MapPickerPageState extends State<MapPickerPage> {
  static double latitude = 0;
  static double longitude = 0;
  static String address="";

  @override
  Widget build(BuildContext context) {
    return OpenStreetMapSearchAndPick(
        center: LatLong(39, 32),
        buttonColor: Colors.green,
        buttonText: 'Set Current Location',
        onPicked: (pickedData) {
          setState(() {
            latitude = pickedData.latLong.latitude;
            longitude = pickedData.latLong.longitude;
            address=pickedData.address;
          });
          Navigator.pop(context);

        });
  }
}
