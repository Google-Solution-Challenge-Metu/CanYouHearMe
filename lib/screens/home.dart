import 'package:dietapp/screens/home/donation/donation_main.dart';
import 'package:dietapp/screens/home/makeyourvoiceheard/home_page.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'home/maps/map_custom.dart';
import 'home/volunteer/volunteer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Home Page",
          style: GoogleFonts.prozaLibre(
            color: const Color(0xffe97d47),
            fontSize: 25,
            fontWeight: FontWeight.w600,
            height: 1.355,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                // BLOOD BUTTON
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/myvh_black.png",width: 75,),
                    SizedBox(width: 5,),
                    Container(
                      width: 180,
                      child:
                        Text('Make Your Voice Heard'),
                    ),
                  ]
                ),
                
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MakeYourVoiceHeardPage()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 95),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: const Color(0xffe97d47),
                    side: const BorderSide(color: Color(0xffe97d47), width: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                // BE VOLUNTEER
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/hands_black.png",width: 75,),
                    SizedBox(width: 5,),
                    Text('Volunteer'),
                    //SizedBox(width: 75,),
                  ]
                ),
                
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VolunteerScreen()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 95),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: Color(0xffe97d47),
                    side: const BorderSide(color: Color(0xffe97d47), width: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                // BOX BUTTON
                //icon: Icon(Icons.wallet_giftcard_outlined),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/donation_main_black.png",width: 75,),
                    SizedBox(width: 5,),
                    Text('Donate'),
                    
                  ]
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationMainScreen()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 95),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: Color(0xffe97d47),
                    side: const BorderSide(color: Color(0xffe97d47), width: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                // MAPS
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/map_black.png",width: 75,),
                    SizedBox(width: 5,),
                    Text('Maps'),
                    //SizedBox(width: 75,),
                  ]
                ),
                
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapUIcustom()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 95),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: Color(0xffe97d47),
                    side: const BorderSide(color: Color(0xffe97d47), width: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
