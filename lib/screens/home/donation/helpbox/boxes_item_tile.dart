import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpBoxItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  HelpBoxItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:15,left:15,top: 30, bottom: 10),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // item image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                imagePath,
                scale: 0.8,
                height: 64,
              ),
            ),

            // item name
            Text(
              itemName,
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            

            MaterialButton(
              onPressed: onPressed,
              color: Color(0xffe97d47),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Text(
                'Add a box',
                style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                  color: Colors.white,
                  //fontSize: 16,
                  fontWeight: FontWeight.w800
                ),
              )

                
              ),
            )
          ],
        ),
      ),
    );
  }
}
