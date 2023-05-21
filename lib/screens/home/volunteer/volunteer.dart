import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/screens/home/volunteer/volunteer_tile.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import '../../../services/volunteer_service.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});
  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  final ReportVolunService _reportService = ReportVolunService();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  var City_name="Ankara";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
            "Volunteer",
            style: GoogleFonts.prozaLibre(
              color: Color(0xffe97d47),
              fontSize: 25,
              fontWeight: FontWeight.w600,
              height: 1.355,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // Go to CartPage
          backgroundColor: Color(0xffe97d47),
          onPressed: null,
          child: const Icon(
            Icons.add,
            size: 35.0,
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '“Alone we can do so little; together we can do so much.”',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.3625,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
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
                                  

                                  
                                  if (myReport['City'] == City_name) {
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
                                        margin: const EdgeInsets.fromLTRB(
                                            3, 0, 3, 9),
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
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    myReport['Date'],                                                        
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                myReport['Description'],
                                                style: GoogleFonts.nunitoSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.3625,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              SizedBox(height: 10),
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
                                                    icon:
                                                        Icon(Icons.location_on),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  IconButton(
                                                    onPressed: () {},
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
                                        children: [
                                          Text("$item_count item is founded."),
                                          const SizedBox(
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
          ]),
        ));
  }
}
