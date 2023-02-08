import "package:flutter/material.dart";
import 'blood.dart';
import 'donation.dart';
import 'helpbox.dart';
import 'volunteer.dart';

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
        backgroundColor: Color(0xFF4E6C50),
        title: Text("Let's Help!"),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton.icon(
          icon: Icon(Icons.bloodtype_rounded),
          label: Text('Blood Donation Sites' ),
          onPressed: (){
          print('button');
          }, 
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            fixedSize: Size(300,95),
            textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            primary: Color.fromARGB(255,130, 0, 0),
            onPrimary: Color.fromARGB(255,242, 222, 186),
            elevation: 15,
            shadowColor: Color.fromARGB(255,130, 0, 0),
            side: BorderSide(color: Color.fromARGB(255,242, 222, 186), width: 4),
            shape: StadiumBorder()
          ),
        ),
          ElevatedButton.icon(
          icon: Icon(Icons.attach_money_sharp),
          label: Text('Donation'),
          onPressed: (){
          print('button');
          }, 
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            fixedSize: Size(300,95),
            textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            primary: Color.fromARGB(255,130, 0, 0),
            onPrimary: Color.fromARGB(255,242, 222, 186),
            elevation: 15,
            shadowColor: Color.fromARGB(255,130, 0, 0),
            side: BorderSide(color: Color.fromARGB(255,242, 222, 186), width: 4),
            shape: StadiumBorder()
          ),
        ),
          ElevatedButton.icon(
          icon: Icon(Icons.back_hand_rounded),
          label: Text('Be Volunteer'),
          onPressed: (){
          print('button');
          }, 
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            fixedSize: Size(300,95),
            textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            primary: Color.fromARGB(255,130, 0, 0),
            onPrimary: Color.fromARGB(255,242, 222, 186),
            elevation: 15,
            shadowColor: Color.fromARGB(255,130, 0, 0),
            side: BorderSide(color: Color.fromARGB(255,242, 222, 186), width: 4),
            shape: StadiumBorder()
          ),
        ),
          ElevatedButton.icon(
          icon: Icon(Icons.wallet_giftcard_outlined),
          label: Text('Give Help Box'),
          onPressed: (){
          print('button');
          }, 
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            fixedSize: Size(300,95),
            textStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            primary: Color.fromARGB(255,130, 0, 0),
            onPrimary: Color.fromARGB(255,242, 222, 186),
            elevation: 15,
            shadowColor: Color.fromARGB(255,130, 0, 0),
            side: BorderSide(color: Color.fromARGB(255,242, 222, 186), width: 4),
            shape: StadiumBorder()
          ),
        ),
        ],
        )
      ),
    );
  }
}

