import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common_widgets/common_button.dart';
import '../../payment/payment_screen.dart';
import '../../signin/signin_screen.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  const SecondOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 160,bottom: 40),
            child: Image.asset('asset/images/secondonboarding.png'),
          ),
          const Text('Get Started with Tradebase',style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xff03314B),
              fontSize: 24),),
          const SizedBox(height: 20,),
          const Text("A place that provides you with the wrold\'s top",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff8198A5),
                fontSize: 14),),
          const Text('stock that you can buy and trade',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff8198A5),
                fontSize: 14),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child:
            CommonButtons(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RozarPaymentScreen(),),);
              },
              color: Color(0xff3500D4),
              child: const Text('Get Started',style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 16),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
              },
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Color(0xffF61C7A),),
              ),
              minWidth: double.infinity,
              color: Color(0xffFFFFFF),
              child: const Text('Sign in',style: TextStyle(
                  color: Color(0xffF61C7A),
                  fontWeight: FontWeight.w700,
                  fontSize: 16),),
            ),
          ),
        ],
      ),
    );
  }
}
