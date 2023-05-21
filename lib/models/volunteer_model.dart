import 'package:cloud_firestore/cloud_firestore.dart';

class Report_Volunteer {
  String Description;
  String City;
  GeoPoint Location;
  String Phone;
  String user;
  String Date;

  Report_Volunteer(
      {
      required this.Description,
      required this.Location,
      required this.City,
      required this.user,
      required this.Date,
      required this.Phone});

  factory Report_Volunteer.fromSnapshot(DocumentSnapshot snapshot) {
    return Report_Volunteer(
        Description: snapshot["Description"],
        Location: snapshot["Location"],
        City: snapshot["City"],
        user: snapshot["user"],
        Date: snapshot["Date"],
        Phone: snapshot["Phone"]);
  }
}
