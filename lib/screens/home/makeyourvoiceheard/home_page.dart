import 'package:dietapp/screens/home/makeyourvoiceheard/post_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/services/report_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MakeYourVoiceHeardPage extends StatefulWidget {
  const MakeYourVoiceHeardPage({super.key});
  @override
  State<MakeYourVoiceHeardPage> createState() => _MakeYourVoiceHeardPageState();
}

class _MakeYourVoiceHeardPageState extends State<MakeYourVoiceHeardPage> {
  final ReportService _reportService = ReportService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xffe97d47),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "Make Your Voice Heard",
          style: GoogleFonts.prozaLibre(
            color: const Color(0xffe97d47),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.355,
          ),
        ),
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
              "Reports",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(),
          ),
          StreamBuilder(
            stream: _reportService.getStatus(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator(color: Color(0xffe97d47))
                  : ListView.separated(
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(),
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot myReport = snapshot.data!.docs[index];
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/profile_black.png"),
                                          const SizedBox(width: 10),
                                          Text(
                                            myReport['user'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        myReport['createdAt']
                                            .toDate()
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12),
                                      )
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
                                  const SizedBox(height: 10),
                                  imagePlace(size.height * 0.3),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.share),
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                        onPressed: () async {
                                          GeoPoint _point =
                                              myReport['location'];
                                          final _map =
                                              'https://www.google.com/maps/search/?api=1&query=${_point.latitude},${_point.longitude}';
                                          if (await (canLaunch(_map))) {
                                            await launch(_map);
                                          }
                                        },
                                        icon: Icon(Icons.location_on),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // Go to CartPage
        backgroundColor: Colors.black,
        onPressed: () {
          showOptions(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
