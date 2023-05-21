import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/models/report.dart';
import 'package:dietapp/services/storage_service.dart';

import '../models/volunteer_model.dart';

class ReportVolunService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageService _storageService = StorageService();

  Future<Report_Volunteer> addStatus(
    String Description,
    GeoPoint Location,
    String City,
    String user,
    String Date,
    String Phone
  ) async {
    var ref = _firestore.collection("Volunteer");


    var documentRef = await ref.add({
      'Description': Description,
      'Location': Location,
      "City": City,
      'user': user,
      'Date': Date,
      'Phone': Phone,
    });

    return Report_Volunteer(
      Description: Description,
      Location: Location,
      City: City,
      user: user,
      Date: Date,
      Phone: Phone,
    );
  }

  //status göstermek için
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore
        .collection("Volunteer")
        .snapshots();

    return ref;
  }

  //status silmek için
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Volunteer").doc(docId).delete();

    return ref;
  }
}
