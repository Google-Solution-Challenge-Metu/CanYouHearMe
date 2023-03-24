import 'package:cloud_firestore/cloud_firestore.dart';

class SosMobileReport {
  String id;
  String status;
  String Name_Surname;
  GeoPoint location;

  SosMobileReport(
      {required this.id,
      required this.status,
      required this.Name_Surname,
      required this.location,
      });

  factory SosMobileReport.fromSnapshot(DocumentSnapshot snapshot) {
    return SosMobileReport(
      id: snapshot.id,
      status: snapshot["status"],
      Name_Surname: snapshot["Name_Surname"],
      location: snapshot["location"],
    );
  }
}