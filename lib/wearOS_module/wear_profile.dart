import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/wearOS_module/wear_login.dart';
import 'package:dietapp/wearOS_module/wear_sos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wear_Profile extends StatefulWidget {
  const Wear_Profile({super.key});
  @override
  State<Wear_Profile> createState() => _Wear_ProfileState();
}

class _Wear_ProfileState extends State<Wear_Profile> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String name = "";
  String surname = "";

  signUserOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return wear_login();
          },
        ),
      );
  }

  FirebaseDocument() async {
    var document = await db.collection('Person').doc(user.uid).get();
    Map<String, dynamic>? value = document.data();
    if (this.mounted){
      setState(() {
        name = value!['name'];
        surname = value['surname'];
      });
    }
  }

  void changeUserProfile() {}

  @override
  Widget build(BuildContext context) {
    FirebaseDocument();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/outline_arrow.png',
                      height: 23,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return sos_page();
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage("assets/images/profile_anonym.webp"),
                      ),
                      InkWell(
                        onTap: signUserOut,
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Color(0xffe97d47),
                          child: const Icon(
                            Icons.logout,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(
                      "$name $surname",
                      style: const TextStyle(
                          fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: Text(
                      "İnsanlara yardım etmeyi seviyorum.",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "25",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w300,
                                fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Gönderi",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]
              )
            )
          ]
        )
      )
    );
  }
}