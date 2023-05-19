import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class VolunteerTile extends StatelessWidget {
  final String Titles;
  final String user;
  final String date;
  final String phoneNumber;
  final GeoPoint location;
  VolunteerTile(
      {super.key,
      required this.Titles,
      required this.user,
      required this.date,
      required this.phoneNumber,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/profile_black.png"),
                      SizedBox(width: 10),
                      Text(
                        user,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  Text(date),
                ],
              ),
              SizedBox(height: 20),
              Text(
                Titles,
                style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.3625,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      final _call = 'tel:$phoneNumber';
                      if (await canLaunch(_call)) {
                        await launch(_call);
                      }
                    },
                    icon: Icon(Icons.call),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () async {
                      final _sms = 'sms:$phoneNumber';
                      if (await canLaunch(_sms)) {
                        await launch(_sms);
                      }
                    },
                    icon: Icon(Icons.message),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () async {
                      final _map =
                          'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';
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
  }
}
