import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/screens/home/volunteer/volunteer_tile.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({super.key});
  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
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
            VolunteerTile(
              Titles:
                  'We need 100 volunteers in Anfa Altinpark who will take care of the earthquake victims individually and meet their clothing needs ',
              date: "06.02.2023",
              user: "user123",
              phoneNumber: "+398982390482",
              location: const GeoPoint(37.008792, 35.3246395),
            ),
            VolunteerTile(
              Titles:
                  'Belko cold storage (behind Ankamall), urgently we need 200 volunteers. Please let’s get to the area immediately. I’ll share a new announcement when it’s no longer needed.',
              date: "06.02.2023",
              user: "user3",
              phoneNumber: "+905447201300",
              location: const GeoPoint(39.0279941, 35.31023030000001),
            ),
            VolunteerTile(
              Titles:
                  'VOLUNTEER INTERPRETERS ARE NEEDED!\nVolunteers are sought to support the international search and rescue teams.',
              date: "06.02.2023",
              user: "user2",
              phoneNumber: "+9213984923",
              location: const GeoPoint(36.2559921, 36.5675623),
            ),
            VolunteerTile(
              Titles:
                  'Sociology undergraduate students prepared a survey on effects of the earthquake on students.The survey duration is 7-8 minutes and will remain open until 23:59 on Tuesday.\nhttps://forms.gle/Hjdgeuhsk6',
              date: "07.02.2023",
              user: "user1",
              phoneNumber: "+932480239432",
              location: const GeoPoint(38.963745, 35.24332189999999),
            ),
          ]),
        ));
  }
}
