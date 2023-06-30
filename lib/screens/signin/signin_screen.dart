import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading_app/resource/validator.dart';
import 'package:trading_app/screens/OTP_authentication/otp_screen.dart';
import 'package:trading_app/screens/dashboard/dashboard_screen.dart';
import 'package:trading_app/screens/signup/signup_screen.dart';
import 'package:trading_app/widgets/common_widgets/common_button.dart';
import 'package:trading_app/widgets/common_widgets/common_textformfeild.dart';

import '../../services/auth_services.dart';
import 'forgot_password_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _passwordVisible = false;
  final AuthServices _auth = AuthServices();
  bool isprocessing = false;
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  Future<void> _showPassword() async {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
  Future<void> _addAllData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isprocessing = true;
      });
      final user = await _auth.signInUsingEmailPassword(
          email: email.text, password: password.text);
      if (user != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),),);
        setState(() {
          isprocessing = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
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
              Padding(
                padding:  EdgeInsets.only(top: 40.h, bottom: 40.h),
                child: Image.asset('asset/images/tradearrow.png'),
              ),
               Text(
                "Let's Sign You In",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff03314B),
                ),
              ),
               SizedBox(
                height: 8.h,
              ),
               Text(
                "Welcome back, you've been missed!",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8198A5),
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CommonTextFormFeild(
                      obscureText: false,
                      controller: email,
                      hintText: 'Email address',
                      validator: Validator.emailValidator,
                    ),
                     SizedBox(
                      height: 18.h,
                    ),
                    CommonTextFormFeild(
                      obscureText: !_passwordVisible,
                      controller: password,
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () => _showPassword(),
                          child: _passwordVisible==true? const Icon(
                        Icons.visibility,
                        color: Color(0xffD3D5DA),
                      ):const Icon(Icons.visibility_off,color: Color(0xffD3D5DA))),
                      validator: Validator.passValidator,
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen(),),);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xff8198A5),
                      ),
                    ),
                  )),
               SizedBox(
                height: 145.h,
              ),
              CommonButtons(
                onPressed: () => _addAllData(),
                color: const Color(0xff3500D4),
                child:  Text(
                  'Login',
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ),
              ),
               SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Color(0xff3500D4)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
