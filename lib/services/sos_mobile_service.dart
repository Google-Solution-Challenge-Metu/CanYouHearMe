import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/services/sos_report_service.dart';


class SosMobileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<SosMobileReport> addStatus(String status, String Name_Surname, GeoPoint location) async {//GeoPoint location
    var ref = _firestore.collection("SOS");



    var documentRef = await ref.add({'status': status, 'Name_Surname':Name_Surname, "location":location, }); //'location':location

    return SosMobileReport(
        id: documentRef.id,
        status: status,
        Name_Surname: Name_Surname,
        location: location,
    );
  }

  //status göstermek için
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("SOS").snapshots();

    return ref;
  }

  //status silmek için
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("SOS").doc(docId).delete();

    return ref;
  }
}
