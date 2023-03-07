import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import '../../services/report_service.dart';
import 'add_device/add_smart_device.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ReportService _reportService = ReportService();
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String name = "";
  String surname = "";

  signUserOut() async {
    await FirebaseAuth.instance.signOut();
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

  void changeUserProfile() {}

  void add_device() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddDevice()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    FirebaseDocument();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Profile",
            style: TextStyle(
              color: Colors.grey.shade800,
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: signUserOut,
              icon: Icon(
                Icons.logout,
                color: Colors.grey.shade600,
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10.0),
              color: Colors.white,
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
                        onTap: () {},
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
                  const SizedBox(
                    height: 10,
                  ),
                  buildButton(changeUserProfile, "Profili Düzenle"),
                  buildButton(add_device, "Add device"),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "My Posts",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Divider(
                      thickness: 1,
                      color: Colors.green[900],
                    ),
                  ),
                  StreamBuilder(
                    stream: _reportService.getStatus(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? const CircularProgressIndicator()
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var item_count = 0;
                                DocumentSnapshot myReport =
                                    snapshot.data!.docs[index];
                                Future<void> _showChoiceDialog(BuildContext) {
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Do you really want to delete this post?'),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        content: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () => _reportService
                                                    .removeStatus(myReport.id)
                                                    .then((value) =>
                                                        Navigator.pop(context)),
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Color(0xffe97d47)),
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              InkWell(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(
                                                    color: Color(0xffe97d47),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }

                                Widget imagePlace(height) {
                                  if (myReport["image"] != "") {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image(
                                        height: height,
                                        image: NetworkImage(myReport["image"]),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox(
                                      height: 10.0,
                                    );
                                  }
                                }

                                if (myReport['user'] == "$name $surname") {
                                  item_count += 1;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      margin: EdgeInsets.fromLTRB(3, 0, 3, 9),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/images/profile_black.png"),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      myReport['user'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text('date'),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              myReport['status'],
                                              style: GoogleFonts.nunitoSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                height: 1.3625,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            imagePlace(size.height * 0.3),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.call),
                                                ),
                                                const SizedBox(width: 10),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.location_on),
                                                ),
                                                const SizedBox(width: 10),
                                                IconButton(
                                                  onPressed: () =>
                                                      _showChoiceDialog(
                                                          context),
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                if (index == snapshot.data!.docs.length - 1 &&
                                    item_count == 0) {
                                  return Center(
                                    child: Column(
                                      children: const [
                                        Text("End of posts."),
                                        SizedBox(
                                          height: 15.0,
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            );
                    },
                  )
                ],
              ),
            ),
          ],
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
}
