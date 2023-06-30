import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading_app/widgets/common_widgets/common_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 45.h, left: 25.w),
            child: Row(
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
                 SizedBox(
                  width: 70.w,
                ),
                 Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03314B),
                  ),
                ),
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 24.w,top: 35.h,bottom: 25.h),
            child: Text('General',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff6C727F),
              ),
            ),
          ),
          row('Notifications'),
          row('Contact Us'),
           Padding(
            padding: EdgeInsets.only(left: 24.w,top: 30.h,bottom: 30.h),
            child: Text('Security',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff6C727F),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 24.w,right: 24.w,bottom: 20.h),
            child:  Row(children: [
              Text('Fingerprint and Face ID',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff03314B),
                ),
              ),
               SizedBox(width: 105.w,),
              Switch(value: switchValue, onChanged: (value) {
               setState(() {
                 switchValue=value;
               });
              },
              activeColor: Color(0xffF61C7A),
                activeTrackColor: Color(0xffFCDDEC),
              )
            ],),
          ),
          row('Privacy Policy'),
           Padding(
            padding: EdgeInsets.only(left: 24.w,top: 8.h,bottom: 25.h),
            child: Text('Choose what data you share with us',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff6C727F),
              ),
            ),
          ),
          row('Legal'),
          Padding(
            padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 110.h),
            child: CommonButtons(onPressed: (){},
              color: Color(0xff908FEC),
            child:  Text('Save',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF),
              ),
            ),
            ),
          )
        ],
      ),
    );
  }

  Padding row(String text) {
    return Padding(
          padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 20.h),
          child: Row(
            children: [
              Container(
                width: 105.w,
                child: Text(text,
                  style:  TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03314B),
                  ),
                ),
              ),
               SizedBox(width: 185.w,),
               Icon(Icons.arrow_forward_ios_outlined,color: Color(0xffD3D5DA),size: 18.h,)
            ],
          ),
        );
  }
}
