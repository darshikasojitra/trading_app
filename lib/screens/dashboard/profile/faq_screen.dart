import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/widgets/common_widgets/common_textformfeild.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    'FAQ',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff03314B),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 35.h,bottom: 35.h),
              child: Container(
                height: 132.h,
                width: 140.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70.w),
                  color: Color(0xffEDF1ECFF)
                ),
                child: Center(child: SvgPicture.asset('asset/images/faqcontainer.svg',height: 55.h,width: 70.w,)),
              ),
            ),
             Text('How can we help you?',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xff03314B),
            ),
            ),
             Padding(
              padding: EdgeInsets.only(left: 24.w,right: 24.w,top: 25.h),
              child: const CommonTextFormFeild(obscureText: false,
                hintText: 'Search topics or questions...',
              prefixIcon: Icon(Icons.search_outlined),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 24..w,top: 24.h,bottom: 24.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    threeContainer(Color(0xffE8F1FF),'Questions about','Getting Started'),
                     SizedBox(width: 16.w,),
                    threeContainer(Color(0xffF3FBED),'Questions about','How to Invest'),
                     SizedBox(width: 16.w,),
                    threeContainer(Color(0xffFFEFEB),'Questions about','Payment Meth…'),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 15.h),
              child: Row(
                children: [
                   Text('Top Questions',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff03314B),
                    ),
                  ),
                   SizedBox(width: 125.w,),
                  TextButton(onPressed: (){}, child:  Text('View All',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffF61C7A),
                    ),
                  ),),
                ],
              ),
            ),
            questioncontainer('How to create a account?',Icons.minimize),
             SizedBox(height: 16.h,),
            questioncontainer('How to add a payment method?',Icons.add),
             SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }

  Container questioncontainer(String text,IconData icon) {
    return Container(
            height: 100.h,width: 330.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.w),
              border: Border.all(color: Color(0xffCCCCCCFF),),
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: 16.w,top: 16.h,right: 16.w,bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text,
                        style:  TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff03314B),
                        ),
                      ),
                      Icon(icon,color: Color(0xffF178B6),)
                    ],
                  ),
                   SizedBox(height: 10.h,),
                  Text('Open the Tradebase app to get started and follow the steps. Tradebase doesn’t charge a fee to create or maintain your Tradebase account.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6C727F),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Container threeContainer(Color containercolor,String title,String Subtitle) {
    return Container(
                height: 105.h,
                width: 145.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  color: containercolor
                ),
                child:  Padding(
                  padding: EdgeInsets.only(left: 24.w,top: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.notifications,color: Color(0xff3500D4),),
                      const SizedBox(height: 23,),
                      Text(title,
                        style:  TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6C727F),
                        ),
                      ),
                       SizedBox(height: 5.h,),
                      Text(Subtitle,
                        style:  TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff03314B),
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}
