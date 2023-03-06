import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dietapp/services/report_service.dart';

import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: implementation_imports, unused_import
import 'package:google_maps_place_picker_mb/src/google_map_place_picker.dart'; // do not import this yourself
import 'dart:io' show Platform;

// Only to control hybrid composition and the renderer in Android
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  static final kInitialPosition = LatLng(38.9637, 35.2433);

  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String name = "";
  String surname = "";
  final ReportService _reportService = ReportService();
  final postController = TextEditingController();
  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var profileImage;

  // for map
  PickResult? selectedPlace;
  bool _showPlacePickerInContainer = false;
  bool _showGoogleMapInContainer = false;
  String androidApiKey="AIzaSyArrKwbIUKX0iZqzYWM4EtvNWbpAC0au1s";
  String iosApiKey="AIzaSyArrKwbIUKX0iZqzYWM4EtvNWbpAC0au1s";

  bool _mapsInitialized = false;
  String _mapsRenderer = "latest";

  double _latitude=0;
  double _longitude=0;
  String _address="";

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

  Widget imagePlace() {
    if (profileImage != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image(
          image: FileImage(File(profileImage!.path)),
        ),
      );
    } else {
      if (_pickImage != null) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image(
            image: NetworkImage(_pickImage),
          ),
        );
      } else {
        return const SizedBox(
          height: 10.0,
        );
      }
    }
  }

  FirebaseDocument() async {
    var document = await db.collection('Person').doc(user.uid).get();
    Map<String, dynamic>? value = document.data();
    if (this.mounted) {
      setState(() {
        name = value!['name'];
        surname = value['surname'];
      });
    }
  }

  handleTakePhoto() async {
    () => Navigator.pop(context);
  }

  handleChooseFromGallery(ImageSource source,
      {required BuildContext context}) async {
    Navigator.pop(context);
    try {
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        profileImage = pickedFile!;
        print("dosyaya geldim: $profileImage");
        if (profileImage != null) {}
      });
      print('aaa');
    } catch (e) {
      setState(() {
        _pickImage = e;
        print("Image Error: $_pickImage");
      });
    }
  }

  void postReport() {
    if(selectedPlace != null){
      setState(() {
        _latitude=selectedPlace!.geometry!.location.lat;
        _longitude=selectedPlace!.geometry!.location.lng;
        _address=selectedPlace!.formattedAddress!;
      });
    };
    _reportService
        .addStatus(
            postController.text,
            profileImage ?? '',
            GeoPoint(_latitude, _longitude),
            _address,
            "$name $surname")
        .then((value) {
      //Toast.show(
      //  "Durum eklendi!",
      //  duration: Toast.lengthShort,
      //  gravity: Toast.bottom,
      //);
      Navigator.pop(context);
    });
  }

  void imagePicker() async {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Pick an image"),
            children: [
              SimpleDialogOption(
                onPressed: handleTakePhoto,
                child: const Text("Photo with Camera"),
              ),
              SimpleDialogOption(
                onPressed: () => handleChooseFromGallery(ImageSource.gallery,
                    context: context),
                child: const Text("Photo from Gallery"),
              ),
              SimpleDialogOption(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseDocument();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a report"),
        backgroundColor: const Color(0xffe97d47),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          buildTextField(postController, "Type the report here.", false),
          const SizedBox(
            height: 10.0,
          ),
          imagePlace(),
          if (selectedPlace != null) ...[
            Text(selectedPlace!.formattedAddress!),
            Text("(lat: " +
                selectedPlace!.geometry!.location.lat.toString() +
                ", lng: " +
                selectedPlace!.geometry!.location.lng.toString() +
                ")"),
          ],
          buildButton(imagePicker, "Pick an image"),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
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
                                initialPosition: PostPage.kInitialPosition,
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
                              );
                            },
                          ),
                        );
                      },
            child: const Card(
              color: Color(0xffe97d47),
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Pick a location",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: postReport,
        icon: const Icon(Icons.save),
        label: const Text("Post"),
        backgroundColor: const Color(0xffe97d47),
      ),
    );
  }

  Padding buildTextField(final controller, String hintText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        minLines: 1,
        maxLines: 7,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }

  Padding buildButton(final Function()? onTap, String buttonText) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 20.0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 250.0,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: const Color(0xffe97d47),
              borderRadius: BorderRadius.circular(12.0)),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
