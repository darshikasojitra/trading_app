import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/screens/OTP_authentication/phone_number_screen.dart';
import 'package:trading_app/widgets/common_widgets/common_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 24.w,top: 50.h,bottom: 80.w),
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
            padding:  EdgeInsets.only(left: 100.w,bottom: 40.h),
            child: Container(
              height: 126.h,
              width: 140.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.w),
                color: Color(0xffc7b8ec),
              ),
              child: Center(child: SvgPicture.asset('asset/images/otplock.svg')),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 65.w,bottom: 20.h),
            child: Text(
              'Secure Your Account',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff03314B),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 55.w,right: 50.w,bottom: 80.h),
            child: Container(
              //color: Colors.blue,
              child:  Text(
                  'One way we keep your account secure is with 2 - step verification, which requires your phone number.',style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Color(0xff8198A5)
              ),),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24,top: 100),
            child: CommonButtons(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumberScreen(),),);
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
        ],
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:pin_input_text_field/pin_input_text_field.dart';
//
// class OtpScreen extends StatefulWidget {
//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   OtpFieldController _otpController = OtpFieldController();
//   String _verificationId = '';
//
//   Future<void> verifyPhoneNumber(String phoneNumber) async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await _auth.signInWithCredential(credential);
//         // Verification is complete, proceed with your desired actions
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         // Handle verification failure
//         print(e.message);
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//       codeSent: (String verificationId, int? forceResendingToken) {
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//     );
//   }
//
//   void signInWithPhoneNumber(String smsCode) async {
//     try {
//       final AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId,
//         smsCode: smsCode,
//       );
//
//       final UserCredential userCredential =
//           await _auth.signInWithCredential(credential);
//       final User? user = userCredential.user;
//
//       // Verification is complete, proceed with your desired actions
//     } catch (e) {
//       // Handle sign in failure
//       print(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // TextField(
//               //   controller: _otpController,
//               //   decoration: InputDecoration(
//               //     labelText: 'Enter OTP',
//               //   ),
//               // ),
//               OTPTextField(
//                   controller: _otpController,
//                   length: 4,
//                   width: MediaQuery.of(context).size.width,
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldWidth: 45,
//                   fieldStyle: FieldStyle.box,
//                   outlineBorderRadius: 15,
//                   style: TextStyle(fontSize: 17),
//                   onChanged: (pin) {
//                     print("Changed: " + pin);
//                   },
//                   onCompleted: (pin) {
//                     print("Completed: " + pin);
//                   }),
//               //   PinInputTextField(
//               //   pinLength: 6, // Length of the PIN code
//               //   decoration: UnderlineDecoration(
//               //     colorBuilder: PinListenColorBuilder(Colors.blue, Colors.red),
//               //     textStyle: TextStyle(fontSize: 20.0),
//               //   ),
//               //   onChanged: (pin) {
//               //     // Handle PIN changes
//               //     print('Current PIN: $pin');
//               //   },
//               //   onSubmit: (pin) {
//               //     // Handle PIN submission
//               //     print('Submitted PIN: $pin');
//               //   },
//               // ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   //signInWithPhoneNumber();
//                 },
//                 child: Text('Verify'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           verifyPhoneNumber('+919510813156'); // Replace with your phone number
//         },
//         child: Icon(Icons.phone),
//       ),
//     );
//   }
// }
