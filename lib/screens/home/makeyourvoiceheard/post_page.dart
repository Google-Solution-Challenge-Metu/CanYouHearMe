import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/screens/home/makeyourvoiceheard/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dietapp/services/report_service.dart';
import 'package:toast/toast.dart';
import 'package:dietapp/screens/home/makeyourvoiceheard/map_picker_page.dart';

import 'google_map_picker.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

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
    _reportService
        .addStatus(
            postController.text,
            profileImage ?? '',
            GeoPoint(MapPickerPageState.latitude, MapPickerPageState.longitude),
            MapPickerPageState.address,
            "$name $surname")
        .then((value) {
      Toast.show(
        "Durum eklendi!",
        duration: Toast.lengthShort,
        gravity: Toast.bottom,
      );
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
          buildButton(imagePicker, "Pick an image"),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPlacesScreen()));
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
