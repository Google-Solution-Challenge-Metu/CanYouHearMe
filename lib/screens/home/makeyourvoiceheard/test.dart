//import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
//
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_webservice/places.dart';
//import 'package:google_api_headers/google_api_headers.dart';
//
//class SearchPlacesScreen extends StatefulWidget {
//  const SearchPlacesScreen({Key? key}) : super(key: key);
//
//  @override
//  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
//}
//
//const kGoogleApiKey = "AIzaSyCNPJCKnLTUA4Z4Ig0cRXlbXIXxGcUSd_k";
//final homeScaffoldKey = GlobalKey<ScaffoldState>();
//
//class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
//  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(37.42796, -122.08574), zoom: 14.0);
//
//  Set<Marker> markersList = {};
//
//  late GoogleMapController googleMapController;
//
//  final Mode _mode = Mode.overlay;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      key: homeScaffoldKey,
//      appBar: AppBar(
//        title: const Text("Google Search Places"),
//      ),
//      body: Stack(
//        children: [
//          GoogleMap(
//            initialCameraPosition: initialCameraPosition,
//            markers: markersList,
//            mapType: MapType.normal,
//            onMapCreated: (GoogleMapController controller) {
//              googleMapController = controller;
//            },
//          ),
//          ElevatedButton(onPressed: _handlePressButton, child: const Text("Search Places"))
//        ],
//      ),
//    );
//  }
//
//  Future<void> _handlePressButton() async {
//    Prediction? p = await PlacesAutocomplete.show(
//        context: context,
//        apiKey: kGoogleApiKey,
//        onError: onError,
//        mode: _mode,
//        language: 'en',
//        strictbounds: false,
//        types: [""],
//        //decoration: InputDecoration(
//        //    hintText: 'Search',
//        //    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white))),
//        components: [Component(Component.country,"tr"),Component(Component.country,"usa")]);
//
//
//    displayPrediction(p!,homeScaffoldKey.currentState);
//  }
//
//  void onError(PlacesAutocompleteResponse response){
//
//    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//      elevation: 0,
//      behavior: SnackBarBehavior.floating,
//      backgroundColor: Colors.transparent,
//      content: AwesomeSnackbarContent(
//        title: 'Message',
//        message: response.errorMessage!,
//        contentType: ContentType.failure,
//      ),
//    ));
//
//    // homeScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(response.errorMessage!)));
//  }
//
//  Future<void> displayPrediction(Prediction p, ScaffoldState? currentState) async {
//
//    GoogleMapsPlaces places = GoogleMapsPlaces(
//      apiKey: kGoogleApiKey,
//      apiHeaders: await const GoogleApiHeaders().getHeaders()
//    );
//
//    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
//
//    final lat = detail.result.geometry!.location.lat;
//    final lng = detail.result.geometry!.location.lng;
//
//    markersList.clear();
//    markersList.add(Marker(markerId: const MarkerId("0"),position: LatLng(lat, lng),infoWindow: InfoWindow(title: detail.result.name)));
//
//    setState(() {});
//
//     googleMapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
//
//  }
//}

import 'package:flutter/material.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: implementation_imports, unused_import
import 'package:google_maps_place_picker_mb/src/google_map_place_picker.dart'; // do not import this yourself
import 'dart:io' show Platform;



// Only to control hybrid composition and the renderer in Android
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';


class SearchPlacesScreen extends StatefulWidget {
  SearchPlacesScreen({Key? key}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;

  @override
  _SearchPlacesScreenState createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  PickResult? selectedPlace;
  bool _showPlacePickerInContainer = false;
  bool _showGoogleMapInContainer = false;
  String androidApiKey="AIzaSyArrKwbIUKX0iZqzYWM4EtvNWbpAC0au1s";
  String iosApiKey="AIzaSyArrKwbIUKX0iZqzYWM4EtvNWbpAC0au1s";

  bool _mapsInitialized = false;
  String _mapsRenderer = "latest";

  void initRenderer() {
    if (_mapsInitialized) return;
    if (widget.mapsImplementation is GoogleMapsFlutterAndroid) {
      switch (_mapsRenderer) {
        case "legacy":
          (widget.mapsImplementation as GoogleMapsFlutterAndroid)
              .initializeWithRenderer(AndroidMapRenderer.legacy);
          break;
        case "latest":
          (widget.mapsImplementation as GoogleMapsFlutterAndroid)
              .initializeWithRenderer(AndroidMapRenderer.latest);
          break;
      }
    }
    setState(() {
      _mapsInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Map Place Picker Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!_mapsInitialized &&
                      widget.mapsImplementation
                          is GoogleMapsFlutterAndroid) ...[
                    Switch(
                        value: (widget.mapsImplementation
                                as GoogleMapsFlutterAndroid)
                            .useAndroidViewSurface,
                        onChanged: (value) {
                          setState(() {
                            (widget.mapsImplementation
                                    as GoogleMapsFlutterAndroid)
                                .useAndroidViewSurface = value;
                          });
                        }),
                    Text("Hybrid Composition"),
                  ]
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!_mapsInitialized &&
                      widget.mapsImplementation
                          is GoogleMapsFlutterAndroid) ...[
                    Text("Renderer: "),
                    Radio(
                        groupValue: _mapsRenderer,
                        value: "auto",
                        onChanged: (value) {
                          setState(() {
                            _mapsRenderer = "auto";
                          });
                        }),
                    Text("Auto"),
                    Radio(
                        groupValue: _mapsRenderer,
                        value: "legacy",
                        onChanged: (value) {
                          setState(() {
                            _mapsRenderer = "legacy";
                          });
                        }),
                    Text("Legacy"),
                    Radio(
                        groupValue: _mapsRenderer,
                        value: "latest",
                        onChanged: (value) {
                          setState(() {
                            _mapsRenderer = "latest";
                          });
                        }),
                    Text("Latest"),
                  ]
                ],
              ),
              !_showPlacePickerInContainer
                  ? ElevatedButton(
                      child: Text("Load Place Picker"),
                      onPressed: () {
                        initRenderer();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PlacePicker(
                                resizeToAvoidBottomInset:
                                    false, // only works in page mode, less flickery
                                apiKey: Platform.isAndroid
                                    ?  androidApiKey
                                    :  iosApiKey,
                                hintText: "Find a place ...",
                                searchingText: "Please wait ...",
                                selectText: "Select place",
                                outsideOfPickAreaText: "Place not in area",
                                initialPosition: SearchPlacesScreen.kInitialPosition,
                                useCurrentLocation: true,
                                selectInitialPosition: true,
                                usePinPointingSearch: true,
                                usePlaceDetailSearch: true,
                                zoomGesturesEnabled: true,
                                zoomControlsEnabled: true,
                                onMapCreated: (GoogleMapController controller) {
                                  print("Map created");
                                },
                                onPlacePicked: (PickResult result) {
                                  print(
                                      "Place picked: ${result.formattedAddress}");
                                  setState(() {
                                    selectedPlace = result;
                                    Navigator.of(context).pop();
                                  });
                                },
                                onMapTypeChanged: (MapType mapType) {
                                  print(
                                      "Map type changed to ${mapType.toString()}");
                                },
                                // #region additional stuff
                                // forceSearchOnZoomChanged: true,
                                // automaticallyImplyAppBarLeading: false,
                                // autocompleteLanguage: "ko",
                                // region: 'au',
                                // pickArea: CircleArea(
                                //   center: HomePage.kInitialPosition,
                                //   radius: 300,
                                //   fillColor: Colors.lightGreen
                                //       .withGreen(255)
                                //       .withAlpha(32),
                                //   strokeColor: Colors.lightGreen
                                //       .withGreen(255)
                                //       .withAlpha(192),
                                //   strokeWidth: 2,
                                // ),
                                // selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                                //   print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                                //   return isSearchBarFocused
                                //       ? Container()
                                //       : FloatingCard(
                                //           bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                //           leftPosition: 0.0,
                                //           rightPosition: 0.0,
                                //           width: 500,
                                //           borderRadius: BorderRadius.circular(12.0),
                                //           child: state == SearchingState.Searching
                                //               ? Center(child: CircularProgressIndicator())
                                //               : ElevatedButton(
                                //                   child: Text("Pick Here"),
                                //                   onPressed: () {
                                //                     // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                //                     //            this will override default 'Select here' Button.
                                //                     print("do something with [selectedPlace] data");
                                //                     Navigator.of(context).pop();
                                //                   },
                                //                 ),
                                //         );
                                // },
                                // pinBuilder: (context, state) {
                                //   if (state == PinState.Idle) {
                                //     return Icon(Icons.favorite_border);
                                //   } else {
                                //     return Icon(Icons.favorite);
                                //   }
                                // },
                                // introModalWidgetBuilder: (context,  close) {
                                //   return Positioned(
                                //     top: MediaQuery.of(context).size.height * 0.35,
                                //     right: MediaQuery.of(context).size.width * 0.15,
                                //     left: MediaQuery.of(context).size.width * 0.15,
                                //     child: Container(
                                //       width: MediaQuery.of(context).size.width * 0.7,
                                //       child: Material(
                                //         type: MaterialType.canvas,
                                //         color: Theme.of(context).cardColor,
                                //         shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(12.0),
                                //         ),
                                //         elevation: 4.0,
                                //         child: ClipRRect(
                                //           borderRadius: BorderRadius.circular(12.0),
                                //           child: Container(
                                //             padding: EdgeInsets.all(8.0),
                                //             child: Column(
                                //               children: [
                                //                 SizedBox.fromSize(size: new Size(0, 10)),
                                //                 Text("Please select your preferred address.",
                                //                   style: TextStyle(
                                //                     fontWeight: FontWeight.bold,
                                //                   )
                                //                 ),
                                //                 SizedBox.fromSize(size: new Size(0, 10)),
                                //                 SizedBox.fromSize(
                                //                   size: Size(MediaQuery.of(context).size.width * 0.6, 56), // button width and height
                                //                   child: ClipRRect(
                                //                     borderRadius: BorderRadius.circular(10.0),
                                //                     child: Material(
                                //                       child: InkWell(
                                //                         overlayColor: MaterialStateColor.resolveWith(
                                //                           (states) => Colors.blueAccent
                                //                         ),
                                //                         onTap: close,
                                //                         child: Row(
                                //                           mainAxisAlignment: MainAxisAlignment.center,
                                //                           children: [
                                //                             Icon(Icons.check_sharp, color: Colors.blueAccent),
                                //                             SizedBox.fromSize(size: new Size(10, 0)),
                                //                             Text("OK",
                                //                               style: TextStyle(
                                //                                 color: Colors.blueAccent
                                //                               )
                                //                             )
                                //                           ],
                                //                         )
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 )
                                //               ]
                                //             )
                                //           ),
                                //         ),
                                //       ),
                                //     )
                                //   );
                                // },
                                // #endregion
                              );
                            },
                          ),
                        );
                      },
                    )
                  : Container(),
              !_showPlacePickerInContainer
                  ? ElevatedButton(
                      child: Text("Load Place Picker in Container"),
                      onPressed: () {
                        initRenderer();
                        setState(() {
                          _showPlacePickerInContainer = true;
                        });
                      },
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: PlacePicker(
                          forceAndroidLocationManager: true,
                          apiKey: Platform.isAndroid
                              ?  androidApiKey
                              :  iosApiKey,
                          hintText: "Find a place ...",
                          searchingText: "Please wait ...",
                          selectText: "Select place",
                          initialPosition: SearchPlacesScreen.kInitialPosition,
                          useCurrentLocation: true,
                          selectInitialPosition: true,
                          usePinPointingSearch: true,
                          usePlaceDetailSearch: true,
                          zoomGesturesEnabled: true,
                          zoomControlsEnabled: true,
                          onPlacePicked: (PickResult result) {
                            setState(() {
                              selectedPlace = result;
                              _showPlacePickerInContainer = false;
                            });
                          },
                          onTapBack: () {
                            setState(() {
                              _showPlacePickerInContainer = false;
                            });
                          })),
              if (selectedPlace != null) ...[
                Text(selectedPlace!.formattedAddress!),
                Text("(lat: " +
                    selectedPlace!.geometry!.location.lat.toString() +
                    ", lng: " +
                    selectedPlace!.geometry!.location.lng.toString() +
                    ")"),
              ],
              // #region Google Map Example without provider
              _showPlacePickerInContainer
                  ? Container()
                  : ElevatedButton(
                      child: Text("Toggle Google Map w/o Provider"),
                      onPressed: () {
                        initRenderer();
                        setState(() {
                          _showGoogleMapInContainer =
                              !_showGoogleMapInContainer;
                        });
                      },
                    ),
              !_showGoogleMapInContainer
                  ? Container()
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: GoogleMap(
                        zoomGesturesEnabled: false,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        compassEnabled: false,
                        mapToolbarEnabled: false,
                        initialCameraPosition: new CameraPosition(
                            target: SearchPlacesScreen.kInitialPosition, zoom: 15),
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        onMapCreated: (GoogleMapController controller) {},
                        onCameraIdle: () {},
                        onCameraMoveStarted: () {},
                        onCameraMove: (CameraPosition position) {},
                      )),
              !_showGoogleMapInContainer ? Container() : TextField(),
              // #endregion
            ],
          ),
        ));
  }
}
