import "package:flutter/material.dart";
import 'blood/blood.dart';
import 'donaiton/donation.dart';
import 'helpbox/intro_screen.dart';
import 'maps/map_custom.dart';
import 'maps/map_main.dart';
import 'volunteer/volunteer.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});
  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E6C50),
        title: const Text("Let's Help!"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                // BLOOD BUTTON
                icon: const Icon(Icons.bloodtype_rounded),
                label: const Text('Blood Donation Sites'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BloodScreen()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 242, 222, 186),
                    backgroundColor: const Color.fromARGB(255, 130, 0, 0),
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 95),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: const Color.fromARGB(255, 130, 0, 0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 242, 222, 186), width: 4),
                    shape: const StadiumBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                // DONATION BUTTON
                icon: Icon(Icons.attach_money_sharp),
                label: Text('Donation'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DonationScreen()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 242, 222, 186),
                    backgroundColor: Color.fromARGB(255, 130, 0, 0),
                    padding: EdgeInsets.all(20.0),
                    fixedSize: Size(300, 95),
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: Color.fromARGB(255, 130, 0, 0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 242, 222, 186), width: 4),
                    shape: StadiumBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                // BE VOLUNTEER
                icon: const Icon(Icons.back_hand_rounded),
                label: const Text('Be Volunteer'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VolunteerScreen()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 242, 222, 186),
                    backgroundColor: const Color.fromARGB(255, 130, 0, 0),
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 95),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: const Color.fromARGB(255, 130, 0, 0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 242, 222, 186), width: 4),
                    shape: const StadiumBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                // BOX BUTTON
                icon: Icon(Icons.wallet_giftcard_outlined),
                label: Text('Give Help Box'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IntroScreen()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 242, 222, 186),
                    backgroundColor: Color.fromARGB(255, 130, 0, 0),
                    padding: EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 95),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: Color.fromARGB(255, 130, 0, 0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 242, 222, 186), width: 4),
                    shape: StadiumBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                // MAPS
                icon: const Icon(Icons.map_outlined),
                label: const Text('Maps'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapUIcustom()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 242, 222, 186),
                    backgroundColor: const Color.fromARGB(255, 130, 0, 0),
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(300, 95),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                    elevation: 15,
                    shadowColor: const Color.fromARGB(255, 130, 0, 0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 242, 222, 186), width: 4),
                    shape: const StadiumBorder()),
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
