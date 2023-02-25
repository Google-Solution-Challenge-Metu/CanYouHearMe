import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'intro2.dart';

class intro1 extends StatefulWidget {
  const intro1({super.key});

  @override
  State<intro1> createState() => _intro1State();
}

class _intro1State extends State<intro1> {
  var fem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // big logo
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                right: 100.0,
                top: 120,
                bottom: 20,
              ),
              child: Image.asset('assets/images/hands.png'),
            ),

            // we deliver groceries at your doorstep
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Help',
                style: GoogleFonts.nunitoSans(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  height: 1.3625 / fem,
                  color: Color(0xffee844e),
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Spacer(),

            // get started button
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return intro2();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(0),
                width: 200,
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xffe97d47),
                ),
                child: const Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "GoogleFonts",
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 2.5,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
//      backgroundColor: Colors.grey[50],
//      body: SafeArea(
//        child: Column(
//           crossAxisAlignment:  CrossAxisAlignment.center,
//          children:  [
//            Container(
//            // helpinghand11Yh (2:18)
//            margin:  EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 37.0),
//            width:  205.0,
//            height:  208.0,
//            child:
//              Image.asset("assets/images/hands.png",
//                fit:  BoxFit.cover,
//              ),
//            ),
//            Container(
//          // component3guj (2:80)
//            margin:  EdgeInsets.fromLTRB(88.0, 0.0, 65.0, 0.0),
//            width:  double.infinity,
//            child:
//              Column(
//                crossAxisAlignment:  CrossAxisAlignment.center,
//                children:  [
//                  Container(
//                    // autogroupvtofBbb (57NyeG9DpBwdm1f1ZGVtof)
//                    padding:  EdgeInsets.fromLTRB(3.0, 0.0, 2.0, 22.0),
//                    width:  double.infinity,
//                    child:
//                      Column(
//                        crossAxisAlignment:  CrossAxisAlignment.center,
//                        children:  [
//                        Container(
//                          // help4fP (I2:80;2:60)
//                          margin:  EdgeInsets.fromLTRB(0.0, 0.0, 9.0, 9.0),
//                          child:
//                            Text(
//                            'Help',
//                             style:  GoogleFonts.nunitoSans (
//                              fontSize:  36,
//                              fontWeight:  FontWeight.w800,
//                              height:  1.3625/fem,
//                              color:  Color(0xffee844e),
//                              ),
//                          ),
//                        ),
//                        Container(
//                        // helpbymakingyourvoiceheardLso (I2:80;2:61)
//                        margin:  EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 39.0),
//                        constraints:  BoxConstraints (
//                            maxWidth:  191.0,
//                            ),
//                        child:
//                          Text(
//                              'Help by making your voice heard.',
//                              textAlign:  TextAlign.center,
//                              style:  GoogleFonts.nunitoSans (
//                                fontSize:  20,
//                                fontWeight:  FontWeight.w800,
//                                height:  1.3625/fem,
//                                color:  Color(0xff000000),
//                              ),
//                          ),
//                      ),
//                        Container(
//                          // component10zSZ (I2:80;4:130)
//                          margin:  EdgeInsets.fromLTRB(67.0, 0.0, 64.0, 0.0),
//                          width:  double.infinity,
//                          child:
//                          Row(
//                          crossAxisAlignment:  CrossAxisAlignment.center,
//                          children:  [
//                          Container(
//                          // ellipse1VeD (I2:80;4:130;4:105)
//                          margin:  EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
//                          width:  10.0,
//                          height:  10.0,
//                          decoration:  BoxDecoration (
//                            borderRadius:  BorderRadius.circular(5.0),
//                            color:  Color(0xffe97d47),
//                          ),
//                          ),
//                          Container(
//                          // ellipse2z5B (I2:80;4:130;4:106)
//                            margin:  EdgeInsets.fromLTRB(0.0, 0.0, 6.0, 0.0),
//                            width:  10.0,
//                            height:  10.0,
//                            decoration:  BoxDecoration (
//                              borderRadius:  BorderRadius.circular(5.0),
//                              color:  Color(0xffd9d9d9),
//                            ),
//                          ),
//                          Container(
//                            // ellipse3sem (I2:80;4:130;4:107)
//                            margin:  EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
//                            width:  10.0,
//                            height:  10.0,
//                            decoration:  BoxDecoration (
//                              borderRadius:  BorderRadius.circular(5.0),
//                              color:  Color(0xffd9d9d9),
//                            ),
//                          ),
//                          Container(
//                            // ellipse4ZnV (I2:80;4:130;4:108)
//                            width:  10.0,
//                            height:  10.0,
//                            decoration:  BoxDecoration (
//                              borderRadius:  BorderRadius.circular(5.0),
//                              color:  Color(0xffd9d9d9),
//                            ),
//                          ),
//                        ],
//                        ),
//                        ),
////                        ],
////                      ),
////                  ),
////                TextButton(
//                  // component1gMK (I2:80;2:76)
//                  onPressed:  () {},
//                  style:  TextButton.styleFrom (
//                    padding:  EdgeInsets.zero,
//                  ),
//                  child:
//                Container(
//                    width:  double.infinity,
//                    height:  56.0,
//                    decoration:  BoxDecoration (
//                      borderRadius:  BorderRadius.circular(25.0),
//                      color:  Color(0xffe97d47),
//                    ),
//                    child:
//                    Text(
//                    'Next',
//                    textAlign:  TextAlign.center,
//                      style:  GoogleFonts.nunitoSans (
//                      fontSize:  20,
//                      fontWeight:  FontWeight.w400,
//                      height:  2.5/fem,
//                      color:  Color(0xffffffff),
//                    ),
//                  ),
//                  ),
//                ),
////                Container(
////                  // skipgPF (I2:80;4:237)
////                  margin:  EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
////                  child:
////                  TextButton(
////                    onPressed:  () {},
////                    style:  TextButton.styleFrom (
////                      padding:  EdgeInsets.zero,
////                    ),
////                    child:
////                    Text(
////                      'Skip',
////                      textAlign:  TextAlign.center,
////                        style:  GoogleFonts.nunitoSans (
//    fontSize:  20,
//    fontWeight:  FontWeight.w400,
//    height:  2.5/fem,
//    color:  Color(0xffe97d47),
//  ),
////                    ),
////                  ),
////                ),
////
////  ],
////  ),
////  ),
////  ],
////  )
////  )
////  );
////
////
////  }
////}
