import 'package:dietapp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class IntroScreen4 extends StatelessWidget {
  const IntroScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(image: AssetImage('assets/images/word_orange.png')),
            const SizedBox(height: 10.0),
            Text(
              LocaleKeys.Intro4_Map.tr(),
              style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 30.0,
                  color: Color(0xffe97d47),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              LocaleKeys.Intro4_motivation.tr(),
              style: TextStyle(
                fontFamily: "Source Sans Pro",
                fontSize: 18.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 30.0,
              width: 200.0,
              child: Divider(
                color: Colors.grey.shade200,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
