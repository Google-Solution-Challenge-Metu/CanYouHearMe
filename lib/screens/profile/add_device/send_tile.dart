import 'package:flutter/material.dart';


class SendTile extends StatelessWidget {
  final Color colorset;
  final void Function()? func;
  const SendTile({super.key, required this.colorset, required this.func,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorset,
        borderRadius: BorderRadius.circular(27),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_tree_outlined ,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 36.0,
              ),
              SizedBox(width: 20,),
              Text("Send a Connection Key",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 17,
              ),),
              IconButton(
                onPressed: func, 
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 40.0,
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}