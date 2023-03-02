
import 'dart:ffi';

import 'package:flutter/material.dart';

class CheckTile extends StatelessWidget {
  final String Titles;
  final bool bools;
  final IconData iconss;
  CheckTile({super.key, required this.Titles, required this.bools, required this.iconss});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:20,right: 20,top:20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255,252,209,159),
          borderRadius: BorderRadius.circular(27),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  iconss,
                  color: Color.fromARGB(255, 227, 76, 1),
                  size: 36.0,
                ),
                SizedBox(width: 20,),
                Text(Titles,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
              ],
            ),
            Checkbox(
                      value: bools,
                      activeColor: Color(0xffe97d47), 
                      onChanged: null),
          ],
        ),
      ),
    );
  }
}