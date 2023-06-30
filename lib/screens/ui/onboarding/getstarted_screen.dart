import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading_app/screens/OTP_authentication/otp_screen.dart';
import '../../../widgets/common_widgets/common_button.dart';
import '../../payment/payment_screen.dart';
import '../../signin/signin_screen.dart';

class GetStartedscreen extends StatefulWidget {
  const GetStartedscreen({Key? key}) : super(key: key);

  @override
  State<GetStartedscreen> createState() => _GetStartedscreenState();
}

class _GetStartedscreenState extends State<GetStartedscreen> {
  int currentindex = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentindex = value;
                  });
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    child: currentindex == 0
                        ? _firstOnBoardingScreen(context, _pageController)
                        : _secondOnBoardingScreen(context),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),
            ),
            currentindex == 0
                ? Padding(
                    padding:  EdgeInsets.only(
                        left: 22.h, right: 22.h, bottom: 40.h, top: 35.h),
                    child: CommonButtons(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      },
                      color: const Color(0xff3500D4),
                      child:  Text(
                        'Next',
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp),
                      ),
                    ),
                  )
                : Padding(
                    padding:  EdgeInsets.only(
                        left: 24.h, right: 24.h, bottom: 25.h, top: 20.h),
                    child: Container(
                      child: Column(
                        children: [
                          CommonButtons(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpScreen(),
                                ),
                              );
                            },
                            color: Color(0xff3500D4),
                            child:  Text(
                              'Get Started',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 20.h),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ));
                              },
                              height: 50.h,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.w),
                                side: const BorderSide(
                                  color: Color(0xffF61C7A),
                                ),
                              ),
                              minWidth: double.infinity,
                              color: Color(0xffFFFFFF),
                              child:  Text(
                                'Sign in',
                                style: TextStyle(
                                    color: Color(0xffF61C7A),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: currentindex == index ? 10.w : 25.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: currentindex == index ? Color(0xff3500D4) : Color(0xffbcabf1),
      ),
    );
  }
}

Widget _firstOnBoardingScreen(BuildContext context, pageController) => Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 140.h),
          child: Image.asset(
            'asset/images/firstonboarding.png',
            height: 250.h,
            width: 350.w,
          ),
        ),
         Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
          child: Text(
            'Buy & Trade Top Stock',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xff03314B),
                fontSize: 24.sp),
          ),
        ),
         Text(
          "A place that provides you with the wrold\'s top",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff8198A5),
              fontSize: 14.sp),
        ),
         Text(
          'stock that you can buy and trade',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff8198A5),
              fontSize: 14.sp),
        ),
      ],
    );

Widget _secondOnBoardingScreen(BuildContext context) => Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 130.h, bottom: 35.h),
          child: Image.asset('asset/images/secondonboarding.png'),
        ),
         Text(
          'Get Started with Tradebase',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xff03314B),
              fontSize: 24.sp),
        ),
         SizedBox(
          height: 16.h,
        ),
         Text(
          "A place that provides you with the wrold\'s top",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff8198A5),
              fontSize: 14.sp),
        ),
         Text(
          'stock that you can buy and trade',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff8198A5),
              fontSize: 14.sp),
        ),
      ],
    );
