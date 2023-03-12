import 'package:dietapp/screens/intro_screens/intro_screen_1.dart';
import 'package:dietapp/screens/intro_screens/intro_screen_2.dart';
import 'package:dietapp/screens/intro_screens/intro_screen_3.dart';
import 'package:dietapp/screens/intro_screens/intro_screen_4.dart';
import 'package:dietapp/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: const [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
              IntroScreen4(),
            ],
          ),
          // dot indicators
          Container(
            alignment: const Alignment(0, 0.75),
            child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: const WormEffect(
                        activeDotColor: Color(0xffe97d47),
                      ),
                    ),
                  ),
                  onLastPage
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: buildButton(
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            ),
                            'Done',
                            const Color(0xffe97d47),
                            Colors.white,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: buildButton(
                            () => _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            ),
                            'Next',
                            const Color(0xffe97d47),
                            Colors.white,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: buildButton(
                      onLastPage
                          ? () {}
                          : () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(),
                                ),
                              ),
                      'Skip',
                      Colors.white,
                      onLastPage ? Colors.white : const Color(0xffe97d47),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildButton(
      Function() onTap, String text, Color buttonColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          width: 150.0,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(12.0)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
