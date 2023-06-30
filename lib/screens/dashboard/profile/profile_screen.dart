import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/screens/dashboard/profile/edit_profile_screen.dart';
import 'package:trading_app/screens/dashboard/profile/faq_screen.dart';
import 'package:trading_app/screens/dashboard/profile/language_screen.dart';
import 'package:trading_app/screens/dashboard/profile/payment_screen.dart';
import 'package:trading_app/screens/dashboard/profile/refer_screen.dart';
import 'package:trading_app/screens/dashboard/profile/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                 EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h, bottom: 30.h),
            child: Row(
              children: [
                 Text(
                  'Profile',
                  style: TextStyle(
                      color: Color(0xff03314B),
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp),
                ),
                 SizedBox(width: 170.w,),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(),),);
                  },
                  child:  Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Color(0xffF61C7A),
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 24.w, right: 24.w),
            child: Row(
              children: [
                Container(
                  height: 66.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.w),
                      color: const Color(0xff908FEC)),
                ),
                 SizedBox(
                  width: 20.w,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kitsbase',
                      style: TextStyle(
                          color: Color(0xff03314B),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'hi.kitsbase@gmail.com',
                      style: TextStyle(
                          color: Color(0xff8198A5),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding:
                 EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h, top: 30.h),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReferScreen(),),);
              },
              child: Container(
                height: 70.h,
                width: 330.w,
                decoration: BoxDecoration(
                  color: const Color(0xffF3FBED),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('asset/images/gift.svg'),
                       SizedBox(
                        width: 20.w,
                      ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Referral Code',
                            style: TextStyle(
                                color: Color(0xff03314B),
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Share your friend get \$20 of free stocks',
                            style: TextStyle(
                                color: Color(0xff03314B),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ));
              },
              child: option('Billing/Payment', 'asset/images/payment.svg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LanguageScreen(),
                    ));
              },
              child: option('Language', 'asset/images/language.svg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingScreen(),
                    ));
              },
              child: option('Setting', 'asset/images/setting.svg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FaqScreen(),
                    ));
              },
              child: option('FAQ', 'asset/images/faq.svg')),
        ],
      ),
    );
  }

  Padding option(String text, String image) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
      child: Row(
        children: [
          SvgPicture.asset(image),
           SizedBox(
            width: 18.w,
          ),
          Container(
            width: 120.w,
            child: Text(
              text,
              style:  TextStyle(
                  color: Color(0xff03314B),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
          ),
           SizedBox(
            width: 115.w,
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xff03314B),
          )
        ],
      ),
    );
  }
}
