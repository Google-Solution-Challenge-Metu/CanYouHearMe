import 'package:cloud_firestore/cloud_firestore.dart';

class SosReport {
  String id;
  String status;
  String Name_Surname;
  GeoPoint location;

  SosReport(
      {required this.id,
      required this.status,
      required this.Name_Surname,
      required this.location,
      });

  factory SosReport.fromSnapshot(DocumentSnapshot snapshot) {
    return SosReport(
      id: snapshot.id,
      status: snapshot["status"],
      Name_Surname: snapshot["Name_Surname"],
      location: snapshot["location"],
    );
  }
}
