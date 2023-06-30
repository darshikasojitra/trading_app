import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/screens/dashboard/portfolio/view_all/viewall_screen.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3FBED),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.only(left: 25.w, top: 48.h),
            child: Text(
              'Portfolio',
              style: TextStyle(
                  color: Color(0xff03314B),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 25.w, top: 28.h),
            child: Row(
              children: [
                Container(
                  height: 44.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.w),
                      color: const Color(0xff3500D4)),
                  child: const Icon(
                    Icons.arrow_upward_outlined,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                 SizedBox(
                  width: 12.w,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today Gains',
                      style: TextStyle(
                          color: Color(0xff03314B),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    Text(
                      '\$2202.42',
                      style: TextStyle(
                          color: Color(0xff121826),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
                 SizedBox(
                  width: 30.w,
                ),
                Container(
                  height: 44.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.w),
                      color: Color(0xffF61C7A)),
                  child: const Icon(
                    Icons.arrow_downward_outlined,
                    color: Color(0xffFFFFFF),
                  ),
                  // child: SvgPicture.asset('asset/images/downarrow.svg',height: 0,width: 0,),
                ),
                 SizedBox(
                  width: 12.w,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall Loss',
                      style: TextStyle(
                          color: Color(0xff03314B),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    Text(
                      '\$5200.11',
                      style: TextStyle(
                          color: Color(0xff121826),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 466.h,
              width: 375.w,
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.w),
                      topRight: Radius.circular(32.w)),
                  color: Color(0xffFFFFFF)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(
                          left: 25.w, right: 25.w, top: 25.h, bottom: 30.h),
                      child: Stack(
                        children: [
                          cardContainer(),
                          Padding(
                            padding:  EdgeInsets.only(top: 118.h,left: 220.w),
                            child:SvgPicture.asset('asset/images/bell.svg')
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(
                          left: 24.w, right: 24.w, bottom: 50.h),
                      child:
                          SvgPicture.asset('asset/images/portfoliochart.svg'),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Row(
                        children: [
                           Text(
                            'Top Stocks',
                            style: TextStyle(
                                color: Color(0xff121826),
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp),
                          ),
                           SizedBox(
                            width: 155.w,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllScreen(),),);
                            },
                            child:  Text(
                              'View all',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffF61C7A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          topstocksrow(
                            'asset/images/twiterlogo.svg',
                            'TWTR',
                            'Twitter Inc.',
                            'asset/images/twiterchart.svg',
                            '\$63.98',
                            '0.23%',
                            Color(0xff1D82CC),
                          ),

                          Padding(
                            padding:  EdgeInsets.only(bottom: 30.h,top: 18.h),
                            child: topstocksrow(
                              'asset/images/google.svg',
                              'GOOGL',
                              'Alphabet Inc.',
                              'asset/images/googlechart.svg',
                              '\$2.84k',
                              '0,58%',
                              Color(0xff1DCC98),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row topstocksrow(String logo, String name, String subname, String graphimage,
      String amount, String percentage, Color color) {
    return Row(
      children: [
        SvgPicture.asset(logo),
         SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:  TextStyle(
                  color: Color(0xff03314B),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              subname,
              style:  TextStyle(
                  color: Color(0xff03314B),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(left: 20.w, right: 10.w),
          child: SvgPicture.asset(
            graphimage,
            width: 100.w,
            color: color,
          ),
        ),
        Column(
          children: [
            Text(
              amount,
              style: TextStyle(
                  color: Color(0xff03314B),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                SvgPicture.asset('asset/images/triangle.svg', color: color),
                Text(
                  percentage,
                  style: TextStyle(
                      color: color, fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Container cardContainer() {
    return Container(
      height: 140.h,
      width: 330.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.w),
        gradient: const LinearGradient(colors: [
          Color(0xff3500D4),
          Color.fromRGBO(246, 28, 122, 0.4),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 25.w, top: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Portfolio Balance',
              style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: Row(
                children: [
                   Text(
                    '\$31,082.20',
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 36.sp),
                  ),
                   SizedBox(
                    width: 8.w,
                  ),
                  smallContainer('810%', Color(0xffFFFFFF), Color(0xffF61C7A))
                ],
              ),
            ),
             Text(
              '\$1,208.24 (Today)',
              style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}

Container smallContainer(String text, Color color, Color textColor) {
  return Container(
    padding:  EdgeInsets.only(left: 8.w, top: 0),
    height: 18.h,
    width: 60.w
    ,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.w)),
    child: Row(
      children: [
        SvgPicture.asset(
          'asset/images/triangle.svg',
        ),
         SizedBox(
          width: 3.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        )
      ],
    ),
  );
}
