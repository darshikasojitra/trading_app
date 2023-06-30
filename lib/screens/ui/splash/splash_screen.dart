import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/screens/ui/onboarding/getstarted_screen.dart';
import '../onboarding/first_onboarding_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => GetStartedscreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 250, bottom: 60),
              child: SvgPicture.asset('asset/images/arrowtrade.svg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                //color: Colors.blue,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Image.asset('asset/images/blue.png'),
                    SizedBox(
                      width: 25,
                    ),
                    Image.asset('asset/images/purple.png'),
                    SizedBox(
                      width: 29,
                    ),
                    Image.asset('asset/images/pink.png'),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
