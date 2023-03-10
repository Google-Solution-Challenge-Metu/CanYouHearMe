import 'package:custom_info_window/custom_info_window.dart';
import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapUIcustom extends StatefulWidget {
  @override
  State<MapUIcustom> createState() => _MapUIStatecustom();
}

class _MapUIStatecustom extends State<MapUIcustom> {
    CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final LatLng _latLng = LatLng(28.7041, 77.1025);
  final double _zoom = 15.0;
  int i_mar=0;
  bool mapToggle = false;
  var currentLocation;

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((currloc){
      setState(() {
        currentLocation=currloc;
        mapToggle=true;
        populateClients();
        i_mar=_markers.length;
        populateClients_safeArea();
        
      });
    });

  }  

  Set<Marker> _markers = {};
  Set<Marker> _markerss = {};
  List<LatLng> _latLang = <LatLng> [
    LatLng(38.4237, 27.1428),LatLng(41.0082, 28.9784)
  ];  
  populateClients_safeArea(){
    //clients=[];
    FirebaseFirestore.instance.collection("markers").get().then((docs){
      if(docs.docs.isNotEmpty){
        for(int i=0; i<docs.docs.length; ++i){
          //clients.add(docs.docs[i].data);
          loadData_safeArea(docs.docs[i].data,i+i_mar);
        }
      }
    });
  }

  loadData_safeArea(_latLang,i){
    _markers.add(
      Marker(
        markerId: MarkerId("$i"),
        position: LatLng(_latLang()['location'].latitude,_latLang()['location'].longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_latLang()['image']),
                        fit: BoxFit.fitWidth,
                        filterQuality: FilterQuality.high),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Color.fromARGB(255, 255, 197, 146)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            _latLang()['clientName'],
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        const Spacer(),
                        Text("!!!")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
                    child: Text(_latLang()['snippet'],
                    maxLines: 2, )
                  )
                ],
              ),
            ),
            LatLng(_latLang()['location'].latitude,_latLang()['location'].longitude),
          );
        },
      ),
    );
    setState(() {

      });
  }
  populateClients(){
    //clients=[];
    FirebaseFirestore.instance.collection("Status").get().then((docs){
      if(docs.docs.isNotEmpty){
        for(int i=0; i<docs.docs.length; ++i){
          //clients.add(docs.docs[i].data);
          loadData(docs.docs[i].data,i);
        }
      }
    });
  }

  loadData(_latLang,i){
    _markers.add(
      Marker(
        markerId: MarkerId("$i"),
        position: LatLng(_latLang()['location'].latitude,_latLang()['location'].longitude),
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_latLang()['image']),
                        fit: BoxFit.fitWidth,
                        filterQuality: FilterQuality.high),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Color.fromARGB(255, 255, 197, 146)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            _latLang()['address'],
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        const Spacer(),
                        Text("!!!")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
                    child: Text(_latLang()['status'],
                    maxLines: 2, )
                  )
                ],
              ),
            ),
            LatLng(_latLang()['location'].latitude,_latLang()['location'].longitude),
          );
        },
      ),
    );
    setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {
    populateClients();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xffe97d47),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Maps",
          style: GoogleFonts.prozaLibre(
            color: const Color(0xffe97d47),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.355,
          ),
        ),
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