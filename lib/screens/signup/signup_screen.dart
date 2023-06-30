import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading_app/resource/validator.dart';
import 'package:trading_app/screens/dashboard/dashboard_screen.dart';
import 'package:trading_app/screens/signin/signin_screen.dart';

import '../../services/auth_services.dart';
import '../../widgets/common_widgets/common_button.dart';
import '../../widgets/common_widgets/common_textformfeild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _passwordVisible = false;
  final AuthServices _auth = AuthServices();
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
  final email = TextEditingController();
  final fullname = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isprocessing = false;

  Future<void> _addData() async {
    setState(() {
      isprocessing = true;
    });
    if (formKey.currentState!.validate()) {
      _auth.registerUsingEmailPassword(
        name: fullname.text.trim(),
        email: email.text,
        password: password.text,);
      setState(() {
        isprocessing = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),),);
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
                'Getting Started',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff03314B),
                ),
              ),
               SizedBox(
                height: 10.h,
              ),
               Text(
                'Create an account to continue!',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff8198A5),
                ),
              ),
               SizedBox(
                height: 40.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CommonTextFormFeild(
                      obscureText: false,
                      controller: fullname,
                      hintText: 'Full name',
                      validator: Validator.nameValidator,
                    ),
                     SizedBox(
                      height: 18.h,
                    ),
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
                      validator: Validator.passValidator,
                      suffixIcon: GestureDetector(
                        onTap: () => _showPassword(),
                        child: _passwordVisible == true
                            ? const Icon(Icons.visibility, color: Color(0xffD3D5DA))
                            : const Icon(Icons.visibility_off,
                                color: Color(0xffD3D5DA)),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 100.h,
              ),
              CommonButtons(
                onPressed: () =>_addData(),
                color: const Color(0xff3500D4),
                child:  Text(
                  'Start',
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
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign In',
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
