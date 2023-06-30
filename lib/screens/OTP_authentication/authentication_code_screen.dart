import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trading_app/screens/dashboard/dashboard_screen.dart';

import '../../widgets/common_widgets/common_button.dart';

class AuthenticationCodeScreen extends StatelessWidget {
  final no;
  const AuthenticationCodeScreen({Key? key, this.no}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpFieldController _otpController = OtpFieldController();
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 24.w, top: 60.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 36.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.w),
                      border: Border.all(color: Colors.black12)),
                  child:  Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18.h,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 24.w, top: 50.h, bottom: 20.h),
              child: Text(
                'Enter Authentication Code',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 24.w, bottom: 50.h, right: 24.w),
              child: Text(
                  'Enter 6 - digit code we just text to your phone number.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,color: Color(0xff8198A5)
              ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 24.w, right: 24.w, bottom: 200.h),
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 6,
                controller: otpController,
                obscureText: false,
                animationType: AnimationType.slide,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(15),
                    inactiveColor: Colors.grey,
                    borderWidth: 1,
                    activeColor: Color(0xff3500D4),
                    fieldHeight: 50,
                    fieldWidth: 40,
                activeFillColor: Color(0xffFFFFFF)
                ),

               // enableActiveFill: true,
                //backgroundColor: Color(0xff3500D4),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 24.w, right: 24.w, bottom: 10.h),
              child: CommonButtons(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                },
                color: const Color(0xff3500D4),
                child:  Text(
                  'Continue',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 24.w, right: 24.w, top: 10.h,bottom: 20.h),
              child: MaterialButton(
                onPressed: () {
                  print(no);
                },
                color: Colors.white,
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                    color: Color(0xff3500D4),
                  ),
                ),
                child:  Text(
                  'Resend Code',
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
