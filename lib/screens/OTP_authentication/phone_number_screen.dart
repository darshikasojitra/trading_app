import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trading_app/screens/OTP_authentication/authentication_code_screen.dart';

import '../../widgets/common_widgets/common_button.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Verification is complete, proceed with your desired actions
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print(e.message);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        setState(() {
          String smsCode = 'xxxx';
          _verificationId = verificationId;
        });
      },
    );
  }

  void signInWithPhoneNumber(String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      // Verification is complete, proceed with your desired actions
    } catch (e) {
      // Handle sign in failure
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    var  no;

    final phoneno = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 24.w,top: 55.h),
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
              padding: EdgeInsets.only(left: 24.w,top: 50.h,bottom: 20.h),
              child: Text('Step - 2 Step Verification',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 24.w,bottom: 40.h),
              child: Text(
                  'Enter your phone number so we can text you an authentication code.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Color(0xff8198A5)
              ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 24.w,right: 24.w,bottom: 260.h),
              child: IntlPhoneField(
                flagsButtonPadding: EdgeInsets.only(left: 10.h),
                dropdownIconPosition: IconPosition.trailing,
                controller: phoneno,
                onChanged: (value) {
                  no = value;
                  //print(no);
                },

                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  // hintStyle: regularTextStyle(
                  //   color: ColorManager.settingiconcolor,
                  //   fontSize: 13,
                  // ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xff3500D4),),
                      borderRadius: BorderRadius.circular(35.w),),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color:  Color(0xff3500D4),),
                      borderRadius: BorderRadius.circular(35.w),),
                  border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color:  Color(0xff3500D4),),
                      borderRadius: BorderRadius.circular(35.w),),
                ),
                initialCountryCode: 'IN',
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 24.w,right: 24.w,bottom: 10.h),
              child: CommonButtons(onPressed: (){
                verifyPhoneNumber(phoneno.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationCodeScreen(no: phoneno.text),),);
              },
                color: Color(0xff3500D4),
                child:  Text(
                  'Continue',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
