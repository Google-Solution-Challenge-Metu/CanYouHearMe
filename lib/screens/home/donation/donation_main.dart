import 'package:dietapp/screens/home/donation/blood/blood.dart';
import 'package:flutter/material.dart';

import 'helpbox/intro_screen.dart';

class DonationMainScreen extends StatelessWidget {
  const DonationMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donation Options',
          style: TextStyle(
            color: Color(0xffe97d47),
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
            ElevatedButton.icon(
              // BLOOD BUTTON
              icon: const Icon(Icons.bloodtype_rounded),
              label: const Text('Blood Donation'),
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
                  shape: const StadiumBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              // BE VOLUNTEER
              icon: const Icon(Icons.back_hand_rounded),
              label: const Text('Money Donation'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DonationMainScreen()));
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
                  shape: const StadiumBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              // BOX BUTTON
              icon: Icon(Icons.wallet_giftcard_outlined),
              label: const Text('Give a helpbox'),
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
                  shape: const StadiumBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
