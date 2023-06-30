import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/widgets/common_widgets/common_button.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  'Referral Code',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03314B),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 60.h,),
          Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 60.h),
                child: SvgPicture.asset('asset/images/oval.svg'),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 44.w,top: 0,bottom: 65.h),
                child: SvgPicture.asset('asset/images/frame.svg'),
              )
            ],
          ),
           Text('Refer & Earn',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xff03314B),
            ),
          ),
           SizedBox(height: 16.h,),
           Text('Share this code with your friend and',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff6C727F),
            ),
          ),
           Text(' both of you will get \$10 free stocks.',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff6C727F),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 35.h,top: 35.h),
            child: Container(
              height: 60.h,
              width: 330.w,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5FD),
                borderRadius: BorderRadius.circular(16.w),
                border: Border.all(color: const Color(0xffF178B6),),
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 20.w,right: 20.w),
                child: Row(
                  children: [
                      Text('TRADEBASE',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff03314B),
                        ),
                      ),
                    SizedBox(width: 82.w,),
                    Icon(Icons.copy_all,color: Color(0xffF61C7A),),
                    Text('Copy Code',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF61C7A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: CommonButtons(onPressed: (){},
              color: Color(0xff3500D4),
            child:  Text('Refer friend',
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
}
