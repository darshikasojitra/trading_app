import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/screens/dashboard/portfolio/view_all/detail_screen.dart';

import '../../home/product.dart';
import '../portfoluio_screen.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  List<Product> products = allProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.only(left: 25.w, top: 45.h),
            child: Text(
              'Portfolio',
              style: TextStyle(
                  color: Color(0xff03314B),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp),
            ),
          ),
          Padding(
            padding:
                 EdgeInsets.only(left: 24.w, right: 24.w, top: 35.h, bottom: 20.h),
            child: portfolioBalance(),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 28.h,bottom: 0.h),
            child: Container(
              height: 452.h,
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
                      padding:
                           EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ViewAllScreen(),
                                ),
                              );
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
                      padding:
                           EdgeInsets.only(left: 24.w, right: 0, top: 0),
                      child: SizedBox(
                        height: 430.h,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: products.length,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Padding(
                              padding:  EdgeInsets.only(bottom: 20.h),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          name: product.title,
                                          subname: product.subtitle,
                                          image: product.image,
                                          amount: product.amount,
                                          percentage: product.percentage),
                                    ),
                                  );
                                },
                                child: topstocksrow(
                                  product.image.toString(),
                                  product.title.toString(),
                                  product.subtitle.toString(),
                                  product.chart.toString(),
                                  product.amount.toString(),
                                  product.percentage.toString(),
                                  product.color as Color,
                                ),
                              ),
                            );
                          },
                        ),
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

  Column portfolioBalance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Portfolio Balance',
          style: TextStyle(
              color: Color(0xff6C727F),
              fontWeight: FontWeight.w700,
              fontSize: 12.sp),
        ),
        Padding(
          padding:  EdgeInsets.only(top: 8.h, bottom: 8.h),
          child: Row(
            children: [
              RichText(
                  text:  TextSpan(
                      text: '\$31,082',
                      style: TextStyle(
                          color: Color(0xff03314B),
                          fontWeight: FontWeight.w700,
                          fontSize: 32.sp),
                      children: [
                    TextSpan(
                      text: '.20',
                      style: TextStyle(
                          color: Color(0xff818080),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    )
                  ])),
               SizedBox(
                width: 8.w,
              ),
              smallContainer(
                '810%',
                const Color(0xffF61C7A),
                const Color(0xffFFFFFF),
              ),
               SizedBox(
                width: 25.w,
              ),
              SvgPicture.asset('asset/images/bell.svg')
            ],
          ),
        ),
        RichText(
            text:  TextSpan(
                text: '\$1,208.24',
                style: TextStyle(
                    color: Color(0xff03314B),
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp),
                children: [
              TextSpan(
                text: '(Today)',
                style: TextStyle(
                    color: Color(0xffF61C7A),
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp),
              )
            ]))
        // const Text(
        //   '\$1,208.24 (Today)',
        //   style: TextStyle(
        //       color: Color(0xffF61C7AF),
        //       fontWeight: FontWeight.w700,
        //       fontSize: 14),
        // ),
      ],
    );
  }
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
        padding: const EdgeInsets.only(left: 20, right: 10),
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
            style:  TextStyle(
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
                    color: color, fontSize: 12.sp, fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      )
    ],
  );
}
