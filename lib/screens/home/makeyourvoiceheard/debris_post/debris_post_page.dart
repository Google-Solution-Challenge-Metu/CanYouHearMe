import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/screens/components/CustomSnackBarContent.dart';
import 'package:dietapp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dietapp/services/report_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

// Only to control hybrid composition and the renderer in Android

class DebrisPostPage extends StatefulWidget {
  DebrisPostPage({Key? key}) : super(key: key);

  @override
  State<DebrisPostPage> createState() => _DebrisPostPageState();
}

class _DebrisPostPageState extends State<DebrisPostPage> {
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
  Completer<GoogleMapController> _controller = Completer();

  double _latitude = 0;
  double _longitude = 0;
  String _address = "";

  late LatLng _currentPostion = LatLng(38.9637, 35.2433);
  Set<Marker> _markers = {};

  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _currentPostion = LatLng(position.latitude, position.longitude);
      _latitude = position.latitude;
      _longitude = position.longitude;
      _address = placemarks.reversed.last.country.toString() +
          " " +
          placemarks.reversed.last.locality.toString() +
          " " +
          placemarks.reversed.last.street.toString() +
          " " +
          placemarks.reversed.last.administrativeArea.toString() +
          " " +
          placemarks.reversed.last.name.toString();
    });
    _markers.add(Marker(
      markerId: MarkerId("currentlocation"),
      position: LatLng(position.latitude, position.longitude),
    ));
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

  handleTakePhoto(ImageSource source, {required BuildContext context}) async {
    () => Navigator.pop(context);
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
    _reportService
        .addStatus(
      postController.text,
      profileImage ?? '',
      GeoPoint(_latitude, _longitude),
      _address,
      "$name $surname",
      DateTime.now(),
    )
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: CustomSnackBarContent(
          errorText: "Your post has been shared",
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
      Navigator.pop(context);
    });
  }

  void imagePicker() async {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
                LocaleKeys.make_your_voice_heard_debris_page_pick_image.tr()),
            children: [
              SimpleDialogOption(
                onPressed: () =>
                    handleTakePhoto(ImageSource.camera, context: context),
                child: Text(
                    LocaleKeys.make_your_voice_heard_debris_page_camera.tr()),
              ),
              SimpleDialogOption(
                onPressed: () => handleChooseFromGallery(ImageSource.gallery,
                    context: context),
                child: Text(
                    LocaleKeys.make_your_voice_heard_debris_page_gallery.tr()),
              ),
              SimpleDialogOption(
                child: Text(
                    LocaleKeys.make_your_voice_heard_debris_page_cancel.tr()),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  void initState() {
    _getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getUserLocation();
    FirebaseDocument();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xffe97d47),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          LocaleKeys.make_your_voice_heard_debris_page_create.tr(),
          style: GoogleFonts.prozaLibre(
            color: const Color(0xffe97d47),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.355,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            buildTextField(postController,
                LocaleKeys.make_your_voice_heard_debris_page_type.tr(), false),
            const SizedBox(
              height: 10.0,
            ),
            imagePlace(),
            buildButton(imagePicker,
                LocaleKeys.make_your_voice_heard_debris_page_pick_image.tr()),
            Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _currentPostion,
                    zoom: 5,
                  ),
                  markers: _markers,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: postReport,
        icon: const Icon(Icons.save),
        label: Text(LocaleKeys.make_your_voice_heard_debris_page_post.tr()),
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
