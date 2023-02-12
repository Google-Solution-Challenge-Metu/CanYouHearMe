import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Custom Snack Bar Class
class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    Key? key, required this.errorText,
  }) : super(key: key);

  final String errorText;


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255,250, 236, 214),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            
            ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text('Notification!', style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 130, 0, 0)),),
                    const Spacer(),
                    Text(
                      errorText,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 56, 54, 54),
                        fontSize: 18,
                        fontStyle: FontStyle.italic
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          )),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset(
                "assets/images/bubbles.svg",
                height: 48,
                width: 40,
                color: Color(0xFF4E6C50),
                ),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/fail.svg",
                  height: 40,
                  color: Color(0xFF4E6C50)
                ),
                Positioned(
                  top: 10,
                  child: SvgPicture.asset(
                    "assets/images/close.svg",
                    height: 16,

                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}