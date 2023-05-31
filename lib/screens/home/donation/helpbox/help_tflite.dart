import 'dart:io';
import 'package:dietapp/screens/components/CustomSnackBarContent.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:dietapp/flutter_tflite-master/lib/tflite.dart';
import 'package:provider/provider.dart';
import '../../../../translations/locale_keys.g.dart';
import 'cart_model.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  late int _index;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    // load our tflite model
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future pickImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }

  Future pickImageCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }

  Future imageClassification(File image) async {
    // Image Classification
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  Future SnackBarBox(String box) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: CustomSnackBarContent(
          errorText: LocaleKeys.donation_helpbox_page_help_tflite_box_added
              .tr(namedArgs: {box: box})),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  void imagePicker() async {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(LocaleKeys
                .donation_helpbox_page_help_tflite_pick_an_image
                .tr()),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  pickImageCamera();
                  Navigator.pop(context);
                },
                child: Text(
                    LocaleKeys.donation_helpbox_page_help_tflite_camera.tr()),
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickImageGallery();
                  Navigator.pop(context);
                },
                child: Text(
                    LocaleKeys.donation_helpbox_page_help_tflite_gallery.tr()),
              ),
              SimpleDialogOption(
                  child: Text(
                      LocaleKeys.donation_helpbox_page_help_tflite_cancel.tr()),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xffe97d47),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          LocaleKeys.donation_helpbox_page_help_tflite_title.tr(),
          style: TextStyle(color: Color(0xffe97d47)),
        ),
      ),
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.file(_image),
                )
              : Container(
                  margin: const EdgeInsets.all(10),
                  child: Opacity(
                    opacity: 0.8,
                    child: Center(
                      child: Text(LocaleKeys
                          .donation_helpbox_page_help_tflite_no_image
                          .tr()),
                    ),
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              children: (imageSelect)
                  ? _results.map((result) {
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "${result['label']} (%${(result['confidence'] * 100).toStringAsFixed(0)})",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 17, 57, 125),
                                    fontSize: 30),
                              ),
                            ),
                            ElevatedButton.icon(
                              // add to customer's cart
                              // Okey button
                              icon: Icon(Icons.assignment_turned_in_outlined),
                              label: Text("${result['label']}"),
                              onPressed: () {
                                Navigator.pop(context);
                                SnackBarBox("${result['label']}");
                                if (result['label'] == 'Clothes') {
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(0);
                                }
                                if (result['label'] == 'Toys') {
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(2);
                                }
                                if (result['label'] == 'Packaged Food') {
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(1);
                                } else {}
                              },

                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xffe97d47),
                                  padding: EdgeInsets.all(20.0),
                                  fixedSize: Size(300, 75),
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  elevation: 15,
                                  shadowColor: Color(0xffe97d47),
                                  side: const BorderSide(
                                      color: Colors.black, width: 4),
                                  shape: StadiumBorder()),
                            ),
                            const SizedBox(
                              // try again button // same fonction with floatingActionButton buttom
                              height: 30,
                            ),
                            ElevatedButton.icon(
                              // Try Again
                              icon: Icon(Icons.assignment_late_outlined),
                              label: Text(LocaleKeys
                                  .donation_helpbox_page_help_tflite_error_message
                                  .tr()),
                              onPressed: pickImageGallery,
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xffe97d47),
                                  padding: EdgeInsets.all(20.0),
                                  fixedSize: Size(300, 75),
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  elevation: 15,
                                  shadowColor: Color(0xffe97d47),
                                  side: const BorderSide(
                                      color: Colors.black, width: 4),
                                  shape: StadiumBorder()),
                            ),
                          ],
                        ),
                      );
                    }).toList()
                  : [],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // pick image
        backgroundColor: Color(0xffe97d47),
        onPressed: imagePicker,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }
}
