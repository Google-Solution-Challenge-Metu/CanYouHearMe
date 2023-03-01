import 'package:cloud_firestore/cloud_firestore.dart';

class SosReport {
  String id;
  String status;
  GeoPoint location;

  SosReport(
      {required this.id,
      required this.status,
      required this.location,});

  factory SosReport.fromSnapshot(DocumentSnapshot snapshot) {
    return SosReport(
      id: snapshot.id,
      status: snapshot["status"],
      location: snapshot["location"],
    );
  }
}
