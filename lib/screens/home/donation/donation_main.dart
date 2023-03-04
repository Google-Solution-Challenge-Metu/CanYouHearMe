import 'package:dietapp/screens/home/donation/blood/blood.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpbox/intro_screen.dart';
import 'money/donation.dart';

class DonationMainScreen extends StatelessWidget {
  const DonationMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donation Options',
          style: GoogleFonts.prozaLibre(
            color: const Color(0xffe97d47),
            fontSize: 25,
            fontWeight: FontWeight.w600,
            height: 1.355,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffe97d47),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              // BLOOD BUTTON
              child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/blood_black.png",width: 60,),
                    SizedBox(width: 5,),
                    Text('Blood Donation'),
                    
                  ]
                ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BloodScreen()));
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
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/money_black.png",width: 60,),
                    SizedBox(width: 5,),
                    Text('Money Donation'),
                    //Container(
                    //  width: 180,
                    //  child:
                    //    Text('Money Donation'),
                    //),
                    
                    
                  ]
                ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DonationScreen()));
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
              // BOX BUTTON
              child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/box_black.png",width: 60,),
                    SizedBox(width: 5,),
                    Text('Donate a box'),
                    
                  ]
                ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntroScreen()));
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
          ],
        ),
      ),
    );
  }
}
