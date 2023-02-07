import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  int _count = 0;
  StateMachineController? controller;
  SMIInput<double>? inputValue;

  double currentLevel = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset(
            "assets/water-bar-demo.riv",
            fit: BoxFit.cover,
            onInit: (artboard) {
              controller = StateMachineController.fromArtboard(
                artboard, 
                "State Machine",
              );
              
              if(controller != null) {
                artboard.addController(controller!);
                inputValue = controller?.findInput("Level");
                inputValue?.change(currentLevel);
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onVerticalDragStart: (details){
                    print(details);
                  },
                  onVerticalDragEnd: (velocity){

                  },
                  onTap: () {
                    setState(() {
                      currentLevel--;
                      _count=_count-100;
                    });
                    inputValue?.change(currentLevel);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  ),
                ),
                Text("${_count}",
                    style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20.0
                    )),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentLevel++;
                      _count=_count+100;
                    });
                    inputValue?.change(currentLevel);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
