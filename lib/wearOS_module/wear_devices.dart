import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rotary_scrollbar/rotary_scrollbar.dart';

class devices_page extends StatefulWidget {
  const devices_page({super.key});

  @override
  State<devices_page> createState() => _devices_pageState();
}

class _devices_pageState extends State<devices_page> {
  final scrollController = ScrollController();
  var item_num=10;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RotaryScrollWrapper(
        rotaryScrollbar: RotaryScrollbar(
          controller: scrollController,
        ),
        child: ListView.builder(
          controller: scrollController,
          itemCount: item_num,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                color: Color.fromARGB(255, 243, 110, 33).withBlue(((255 / item_num) * index).toInt()),
                width: 50,
                height: 50,
                child: Center(child: Text('Device $index')),
              ),
            );
          },
          
        ),
      ),
    );
  }
}