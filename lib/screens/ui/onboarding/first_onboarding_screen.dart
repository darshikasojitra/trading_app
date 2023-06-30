import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/screens/ui/onboarding/second_onboarding_screen.dart';

import '../../../widgets/common_widgets/common_button.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Image.asset(
                'asset/images/firstonboarding.png',
                height: 250,
                width: 350,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 25),
              child: Text(
                'Buy & Trade Top Stock',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03314B),
                    fontSize: 24),
              ),
            ),
            const Text(
              "A place that provides you with the wrold\'s top",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8198A5),
                  fontSize: 14),
            ),
            const Text(
              'stock that you can buy and trade',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8198A5),
                  fontSize: 14),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 100, bottom: 20),
              child: CommonButtons(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondOnBoardingScreen(),
                    ),
                  );
                },
                color: const Color(0xff3500D4),
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
