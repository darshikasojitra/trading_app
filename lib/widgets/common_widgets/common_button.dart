import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonButtons extends StatelessWidget {
  final void Function() onPressed;
  final Widget? child;
  final Color? color;
  const CommonButtons(
      {Key? key, required this.onPressed, this.color, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      minWidth: double.infinity,
      color: color,
      child: child,
    );
  }
}
