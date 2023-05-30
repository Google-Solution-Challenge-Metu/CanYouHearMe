import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final descriptionController = TextEditingController();
  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var profileImage;

  String username = "";

  void initState() {
    super.initState();
    FirebaseDocument();
  }

  FirebaseDocument() async {
    var document = await db.collection('Person').doc(user.uid).get();
    Map<String, dynamic>? value = document.data();
    if (this.mounted) {
      setState(() {
        String a = value!['name'];
        String b = value['surname'];
        username = "$a $b";
      });
    }
  }

  Widget imagePlace() {
    if (profileImage != null) {
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: FileImage(
              File(profileImage!.path),
            ),
          ),
          InkWell(
            onTap: () => imagePicker(),
            child: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Color(0xffe97d47),
              child: Icon(
                Icons.edit,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    } else {
      if (_pickImage != null) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(_pickImage),
            ),
            InkWell(
              onTap: () => imagePicker(),
              child: const CircleAvatar(
                radius: 15.0,
                backgroundColor: Color(0xffe97d47),
                child: Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      } else {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("assets/images/profile_anonym.webp"),
            ),
            InkWell(
              onTap: () => imagePicker(),
              child: const CircleAvatar(
                radius: 15.0,
                backgroundColor: Color(0xffe97d47),
                child: Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      }
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

  void imagePicker() async {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(LocaleKeys.Profile_editProfile_pickImage.tr()),
            children: [
              SimpleDialogOption(
                onPressed: () =>
                    handleTakePhoto(ImageSource.camera, context: context),
                child: Text(LocaleKeys.Profile_editProfile_photoCam.tr()),
              ),
              SimpleDialogOption(
                onPressed: () => handleChooseFromGallery(ImageSource.gallery,
                    context: context),
                child: Text(LocaleKeys.Profile_editProfile_photoGall.tr()),
              ),
              SimpleDialogOption(
                child: Text(LocaleKeys.Profile_editProfile_cancel.tr()),
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          LocaleKeys.Profile_editProfile_editProfile.tr(),
          style: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              imagePlace(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  username,
                  style: const TextStyle(
                      fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: buildTextField(descriptionController,
                    LocaleKeys.Profile_editProfile_newDescription.tr(), false),
              ),
              Text(LocaleKeys.Profile_editProfile_toChangePswrd.tr()),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: buildTextField(
                    descriptionController, LocaleKeys.Profile_editProfile_NewPassword.tr(), false),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: buildTextField(
                    descriptionController, LocaleKeys.Profile_editProfile_ConfirmPassword.tr(), false),
              ),
              buildButton(() => null, LocaleKeys.Profile_editProfile_ConfirmChanges.tr()),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildButton(final Function()? onTap, String buttonText) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 5.0,
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

  TextField buildTextField(
      final controller, String hintText, bool obscureText) {
    return TextField(
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
    );
  }
}
