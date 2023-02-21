import 'package:dietapp/screens/components/posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void changeUserProfile() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Profile",
            style: TextStyle(
              color: Colors.grey.shade800,
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: signUserOut,
                icon: Icon(
                  Icons.logout,
                  color: Colors.grey.shade600,
                )),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage("assets/images/profile_anonym.webp"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.green[600],
                          child: const Icon(
                            Icons.edit,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(
                      "Mithat Can Timurcan",
                      style: TextStyle(
                          fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: Text(
                      "İnsanlara yardım etmeyi seviyorum.",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "25",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w300,
                                fontSize: 20.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Gönderi",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w300,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  buildButton(changeUserProfile, "Profili Düzenle")
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Gönderiler",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 1.0,
                          color: Colors.green[900],
                        ),
                        GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio: 1,
                          children: List.generate(5, (index) => PostBuilder()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildButton(final Function()? onTap, String buttonText) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 20.0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 250.0,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Color(0xFF4E6C50),
              borderRadius: BorderRadius.circular(12.0)),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
