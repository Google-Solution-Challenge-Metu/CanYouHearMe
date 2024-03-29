import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/CustomSnackBarContent.dart';
import 'utils.dart';
import '/../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});
  @override
  State<DonationScreen> createState() => _DonationScreen();
}

Future<void> _sendSMS() async {
  List<String> recipients = ["1866"];
  try {
    String _result = await sendSMS(
      message: "DEPREM",
      recipients: recipients,
      sendDirect: false,
    );
  } catch (error) {}
}

class _DonationScreen extends State<DonationScreen> {
  final donateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    bool fifty = false;
    bool hunder = false;
    bool fifhun = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xffe97d47),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          LocaleKeys.donation_money_page_title.tr(),
          style: GoogleFonts.prozaLibre(
            color: const Color(0xffe97d47),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.355,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView(
            children: [
              Container(
                // frame31gPi (49:27)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 33 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // frame252Cg (32:21)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // unsplashgvgx4mirimmg4 (26:149)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 10 * fem),
                            width: double.infinity,
                            height: 175 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20 * fem),
                              color: Color(0xffc4c4c4),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/deprembagis.jpeg',
                                ),
                              ),
                            ),
                          ),
                          Text(
                            // donateforkidstotheirwellbeing4 (26:150)
                            LocaleKeys.donation_money_page_description.tr(),
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // frame17Nfr (40:59)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 146 * fem, 0 * fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            // ishafoundationdbn (40:62)
                            LocaleKeys.donation_money_page_afad.tr(),
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
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
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 149 * fem, 31 * fem),
                child: Text(
                  LocaleKeys.donation_money_page_choose_amount.tr(),
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 22 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.5 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // frame32ga4 (49:28)
                margin:
                    EdgeInsets.fromLTRB(2 * fem, 0 * fem, 2 * fem, 47 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // frame30DK6 (49:26)
                      width: double.infinity,
                      height: 86 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15 * fem,
                          ),
                          GestureDetector(
                              onTap: () => setState(() {
                                    fifty = true;
                                    hunder = false;
                                    fifhun = false;
                                  }),
                              child: Container(
                                width: 96 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffe97d47)),
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x26000000),
                                      offset: Offset(0 * fem, 0 * fem),
                                      blurRadius: 2 * fem,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    '\$50',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 17 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5 * ffem / fem,
                                      color: Color.fromARGB(195, 233, 125, 71),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 20 * fem,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              fifty = false;
                              hunder = true;
                              fifhun = false;
                            }),
                            child: Container(
                              // group111Vr (49:24)
                              width: 96 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(20 * fem),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    offset: Offset(0 * fem, 0 * fem),
                                    blurRadius: 2 * fem,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '\$100',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 17 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20 * fem,
                          ),
                          GestureDetector(
                              onTap: () => setState(() {
                                    fifty = false;
                                    hunder = false;
                                    fifhun = true;
                                    print(fifhun);
                                  }),
                              child: (!fifhun)
                                  ? Container(
                                      // group10GAt (49:23)
                                      width: 96 * fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(20 * fem),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x26000000),
                                            offset: Offset(0 * fem, 0 * fem),
                                            blurRadius: 2 * fem,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          '\$500',
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 17 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 96 * fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffe97d47)),
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(20 * fem),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x26000000),
                                            offset: Offset(0 * fem, 0 * fem),
                                            blurRadius: 2 * fem,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          '\$50',
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 17 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5 * ffem / fem,
                                            color: Color.fromARGB(
                                                195, 233, 125, 71),
                                          ),
                                        ),
                                      ),
                                    )),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupekhrMi8 (E6DpDLQXbqwZgebsCDeKHr)
                      padding: EdgeInsets.fromLTRB(
                          3 * fem, 31 * fem, 3 * fem, 0 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // group86fi (36:43)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 31 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Opacity(
                                  // rectangle22Emv (36:40)
                                  opacity: 0.3,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                    width: 141 * fem,
                                    height: 1 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xffe97d47),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 11 * fem,
                                ),
                                Text(
                                  // orvek (36:39)
                                  LocaleKeys.donation_money_page_or.tr(),
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 17 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xffe97d47),
                                  ),
                                ),
                                SizedBox(
                                  width: 11 * fem,
                                ),
                                Opacity(
                                  // rectangle233zG (36:41)
                                  opacity: 0.3,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                    width: 141 * fem,
                                    height: 1 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xffe97d47),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          buildTextField(
                              donateController,
                              LocaleKeys.donation_money_page_enter_manually
                                  .tr(),
                              false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: CustomSnackBarContent(
                      errorText: LocaleKeys.donation_money_page_thank_you.tr(),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ));
                },
                child: Container(
                  // frame28qQL (36:49)
                  margin:
                      EdgeInsets.fromLTRB(1 * fem, 0 * fem, 2 * fem, 0 * fem),
                  width: double.infinity,
                  height: 56 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * fem),
                    gradient: LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                      colors: <Color>[Color(0xffe97d47), Color(0xffe97d47)],
                      stops: <double>[0, 1],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.donation_money_page_first_button.tr(),
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.5 * ffem / fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: CustomSnackBarContent(
                      errorText: LocaleKeys.donation_money_page_thank_you.tr(),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ));
                  _sendSMS();
                },
                child: Container(
                  // frame28qQL (36:49)
                  margin:
                      EdgeInsets.fromLTRB(1 * fem, 0 * fem, 2 * fem, 0 * fem),
                  width: double.infinity,
                  height: 56 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * fem),
                    gradient: LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                      colors: <Color>[Color(0xffe97d47), Color(0xffe97d47)],
                      stops: <double>[0, 1],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.donation_money_page_second_button.tr(),
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.5 * ffem / fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextField(final controller, String hintText, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
