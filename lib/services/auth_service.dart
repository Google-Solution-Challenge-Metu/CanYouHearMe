import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> createPerson(GoogleSignInAccount? gUser, uid) async {
    await _firestore.collection("Person").doc(uid).set({
      'name': gUser?.displayName,
      'surname': "",
      'email': gUser?.email,
      'password': "",
    });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    var credentials =
        await FirebaseAuth.instance.signInWithCredential(credential);
    createPerson(gUser, credentials.user?.uid);
  }
}
