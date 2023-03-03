import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  String id;
  String status;
  String image;
  GeoPoint location;
  String address;
  String user;

  Report(
      {required this.id,
      required this.status,
      required this.image,
      required this.location,
      required this.address,
      required this.user});

  factory Report.fromSnapshot(DocumentSnapshot snapshot) {
    return Report(
      id: snapshot.id,
      status: snapshot["status"],
      image: snapshot["image"],
      location: snapshot["location"],
      address: snapshot["address"],
      user: snapshot["user"],
    );
  }
}
