import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // donationxic (26:124)
        padding: EdgeInsets.fromLTRB(29*fem, 52*fem, 29*fem, 46*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffdfdfd),
          borderRadius: BorderRadius.circular(40*fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // frame31gPi (49:27)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 33*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // frame252Cg (32:21)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // unsplashgvgx4mirimmg4 (26:149)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                          width: double.infinity,
                          height: 175*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20*fem),
                            color: Color(0xffc4c4c4),
                            image: DecorationImage (
                              fit: BoxFit.cover,
                              image: AssetImage (
                                'assets/images/deprembagis.jpeg',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          // donateforkidstotheirwellbeing4 (26:150)
                          'Donate for kids to their well being',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 18*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // frame17Nfr (40:59)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 146*fem, 0*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        Text(
                          // ishafoundationdbn (40:62)
                          'AFAD Foundation',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 18*ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // chooseamountZEY (34:31)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 149*fem, 31*fem),
              child: Text(
                'Choose Amount',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 22*ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.5*ffem/fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // frame32ga4 (49:28)
              margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 2*fem, 47*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // frame30DK6 (49:26)
                    width: double.infinity,
                    height: 86*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group12xnU (49:25)
                          width: 96*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            border: Border.all(color: Color(0xffff607d)),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20*fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x26000000),
                                offset: Offset(0*fem, 0*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '\$50',
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 17*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5*ffem/fem,
                                color: Color.fromARGB(255,130, 0, 0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20*fem,
                        ),
                        Container(
                          // group111Vr (49:24)
                          width: 96*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20*fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x26000000),
                                offset: Offset(0*fem, 0*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '\$100',
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 17*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20*fem,
                        ),
                        Container(
                          // group10GAt (49:23)
                          width: 96*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20*fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x26000000),
                                offset: Offset(0*fem, 0*fem),
                                blurRadius: 2*fem,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '\$500',
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 17*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupekhrMi8 (E6DpDLQXbqwZgebsCDeKHr)
                    padding: EdgeInsets.fromLTRB(3*fem, 31*fem, 3*fem, 0*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group86fi (36:43)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 31*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Opacity(
                                // rectangle22Emv (36:40)
                                opacity: 0.3,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                  width: 141*fem,
                                  height: 1*fem,
                                  decoration: BoxDecoration (
                                    color: Color(0x4c9d9d9d),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 11*fem,
                              ),
                              Text(
                                // orvek (36:39)
                                'or',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 17*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xff9d9d9d),
                                ),
                              ),
                              SizedBox(
                                width: 11*fem,
                              ),
                              Opacity(
                                // rectangle233zG (36:41)
                                opacity: 0.3,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                  width: 141*fem,
                                  height: 1*fem,
                                  decoration: BoxDecoration (
                                    color: Color(0x4c9d9d9d),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group9xrL (36:48)
                          margin: EdgeInsets.fromLTRB(29.5*fem, 0*fem, 29.5*fem, 0*fem),
                          width: double.infinity,
                          height: 76*fem,
                          decoration: BoxDecoration (
                            color: Color(0x26cdcdcd),
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Enter Price Manually',
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5*ffem/fem,
                                color: Color(0xff9d9d9d),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // frame28qQL (36:49)
              margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 2*fem, 0*fem),
              width: double.infinity,
              height: 56*fem,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(20*fem),
                gradient: LinearGradient (
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[Color.fromARGB(255,242, 222, 186), Color.fromARGB(255,242, 222, 186)],
                  stops: <double>[0, 1],
                ),
              ),
              child: Center(
                child: Text(
                  'Donate now',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.5*ffem/fem,
                    color: Color.fromARGB(255,130, 0, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}