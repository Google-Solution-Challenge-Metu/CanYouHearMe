import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  String id;
  String status;
  String image;

  Report({required this.id, required this.status, required this.image});

  factory Report.fromSnapshot(DocumentSnapshot snapshot) {
    return Report(
      id: snapshot.id,
      status: snapshot["status"],
      image: snapshot["image"],
    );
  }
}
