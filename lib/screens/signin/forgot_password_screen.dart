import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading_app/resource/validator.dart';
import 'package:trading_app/widgets/common_widgets/common_button.dart';
import 'package:trading_app/widgets/common_widgets/common_textformfeild.dart';

import '../../services/auth_services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id = 'ResetPasswordScreen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (fromKey.currentState!.validate()) {
      _auth.resetpassword(email: _emailController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3500D4),
        title: Text('Reset Password'),
      ),
      body: Form(
        key: fromKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.h),
          child: Column(
            children: [
              CommonTextFormFeild(
                obscureText: false,
                controller: _emailController,
                hintText: 'Enter Email Address',
                labelText: 'Email Address',
                validator: Validator.emailValidator,
              ),
              SizedBox(
                height: 30.h,
              ),
              CommonButtons(
                onPressed: () => _resetPassword(),
                color: Color(0xff3500D4),
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
