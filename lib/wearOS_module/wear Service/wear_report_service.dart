import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp/wearOS_module/wear%20Service/wear_report.dart';

class SOSReportService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<SosReport> addStatus(String status, String Name_Surname,) async {//GeoPoint location
    var ref = _firestore.collection("SOS");



    var documentRef = await ref.add({'status': status, 'Name_Surname':Name_Surname, }); //'location':location

    return SosReport(
        id: documentRef.id,
        status: status,
        Name_Surname: Name_Surname,
        //location: location,
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
