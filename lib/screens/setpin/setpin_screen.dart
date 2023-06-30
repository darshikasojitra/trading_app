import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SetPinScreen extends StatelessWidget {
  const SetPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100,left: 100,right: 100),
            child: Stack(
              children: [
                Container(
                  height: 140,width: 140,
                  decoration: BoxDecoration(
                      color: const Color(0xffB6B5D9FF),
                    borderRadius: BorderRadius.circular(70)
                  ),
                ),
            Positioned(
                      top: 2,left: 5,right: 5,
                      child: SvgPicture.asset('asset/images/lock.svg')),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25,bottom: 15),
            child: Text('Setup PIN',style: TextStyle(
              color: Color(0xff03314B),
              fontWeight: FontWeight.w700,
              fontSize: 24
            ),),
          ),
          const Text('Enter your PIN number',style: TextStyle(
              color: Color(0xff8198A5),
              fontWeight: FontWeight.w400,
              fontSize: 14
          ),),

        ],
      ),
    );
  }
}
