import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:dietapp/flutter_tflite-master/lib/tflite.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.file(_image),
                )
              : Container(
                  margin: const EdgeInsets.all(10),
                  child: const Opacity(
                    opacity: 0.8,
                    child: Center(
                      child: Text("No image selected"),
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
                                "${result['label']} (%${(result['confidence']*100).toStringAsFixed(0)})",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 17, 57, 125), fontSize: 30),
                              ),
                            ),
                            ElevatedButton.icon(
                              // Okey button
                              icon: Icon(Icons.assignment_turned_in_outlined),
                              label: Text("${result['label']}"),
                              onPressed: () {
                                //Navigator.push(context,MaterialPageRoute(builder: (context) => DonationScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Color.fromARGB(255, 242, 222, 186),
                                  backgroundColor: Color.fromARGB(255, 130, 0, 0),
                                  padding: EdgeInsets.all(20.0),
                                  fixedSize: Size(300, 75),
                                  textStyle:
                                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  elevation: 15,
                                  shadowColor: Color.fromARGB(255, 130, 0, 0),
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 242, 222, 186), width: 4),
                                  shape: StadiumBorder()),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton.icon(
                              // Try Again
                              icon: Icon(Icons.assignment_late_outlined),
                              label: Text("No, Try Again"),
                              onPressed: pickImage,
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Color.fromARGB(255, 242, 222, 186),
                                  backgroundColor: Color.fromARGB(255, 130, 0, 0),
                                  padding: EdgeInsets.all(20.0),
                                  fixedSize: Size(300, 75),
                                  textStyle:
                                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  elevation: 15,
                                  shadowColor: Color.fromARGB(255, 130, 0, 0),
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 242, 222, 186), width: 4),
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
        backgroundColor: Color.fromARGB(255,130, 0, 0),
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}