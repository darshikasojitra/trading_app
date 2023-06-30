import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonTextFormFeild extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  const CommonTextFormFeild(
      {Key? key,
      this.controller,
      this.hintText,
        required this.obscureText,
      this.suffixIcon,
        this.prefixIcon,
        this.validator,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        helperStyle:  TextStyle(
            color: Colors.grey
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xff908FEC)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xff908FEC)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
    );
  }
}
