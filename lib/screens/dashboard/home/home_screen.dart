import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/screens/dashboard/home/product.dart';
import 'package:trading_app/services/auth_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthServices auth = AuthServices();
    User? user;
    user = auth.getUser();
    List<Product> products = allProducts;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 25.w,top: 45.h),
            child: intro(user),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 25.h, bottom: 20.h, right: 25.w,left: 25.w),
            child: cardContainer(),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 25.w,right: 25.w),
            child: Row(
              children: [
                 Text(
                  'Portfolio',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03314B),
                  ),
                ),
                 SizedBox(
                  width: 160.w,
                ),
                TextButton(
                  onPressed: () {},
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
          portfolioContainer(products),
           Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 15.h,left: 25.w),
            child: Text(
              'Your watchlist',
              style: TextStyle(
                  color: Color(0xff03314B),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 25.w,right: 0.w),
            child: Row(
              children: [
                SvgPicture.asset('asset/images/twiterlogo.svg'),
                 SizedBox(
                  width: 10.w,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TWTR',
                      style: TextStyle(
                          color: Color(0xff03314B),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Twitter Inc.',
                      style: TextStyle(
                          color: Color(0xff03314B),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 30.w, right: 10.w),
                  child: SvgPicture.asset(
                    'asset/images/twiterchart.svg',
                    width: 100.w,
                  ),
                ),
                Column(
                  children: [
                     Text(
                      '\$63.98',
                      style: TextStyle(
                          color: Color(0xff03314B),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'asset/images/triangle.svg',
                          color: const Color(0xff1DCC98),
                        ),
                         Text(
                          '0.23%',
                          style: TextStyle(
                              color: Color(0xff1DCC98),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container portfolioContainer(List<Product> products) {
    return Container(
      height: 140.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding:index == 0?  EdgeInsets.only(right: 20,left: 25.w) : EdgeInsets.only(right: 25.w),
            child: Container(
                height: 140.h,
                width: 195.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.w),
                  color: const Color(0xffFFFFFFFF),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 20.w, top: 15.h, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            product.image.toString(),
                          ),
                           SizedBox(
                            width: 13.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title.toString(),
                                style:  TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff03314B),
                                ),
                              ),
                              Text(
                                product.subtitle.toString(),
                                style:  TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff03314B),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                       SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        product.amount.toString(),
                        style:  TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff03314B),
                        ),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            product.subammount.toString(),
                            style:  TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffF61C7A),
                            ),
                          ),
                           SizedBox(
                            width: 15.w,
                          ),
                          smallContainer(
                            product.percentage.toString(),
                            const Color(0xffF61C7A),
                            const Color(0xffFFFFFF),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }

  Container cardContainer() {
    return Container(
      height: 190.h,
      width: 330.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.w),
        gradient: const LinearGradient(colors: [
          Color(0xff3500D4),
          Color.fromRGBO(246, 28, 122, 0.4),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 25.w, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Your Total  Balance',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF),
              ),
            ),
             SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                RichText(
                  text:  TextSpan(
                      text: '\$12,031,082',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp),
                      children: [
                        TextSpan(
                          text: '.20',
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp),
                        )
                      ]),
                ),
                 SizedBox(
                  width: 10.h,
                ),
                smallContainer(
                    '810%', const Color(0xffFFFFFF), const Color(0xffF61C7A)),
              ],
            ),
             SizedBox(
              height: 15.h,
            ),
             Text(
              '\$1,208.24',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 25.h, right: 25.w),
              child: Container(
                height: 38.h,
                width: 275.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: const Color(0xffFFFFFF),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 15.w),
                  child: Row(
                    children: [
                      Container(
                        height: 9.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: const Color(0xff3500D4),
                        ),
                      ),
                       SizedBox(
                        width: 5.w,
                      ),
                       Text(
                        'APPL: 70%',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff121826),
                        ),
                      ),
                       SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 9.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: const Color(0xffF61C7A),
                        ),
                      ),
                       SizedBox(
                        width: 5.w,
                      ),
                       Text(
                        'MSFT: 20%',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff121826),
                        ),
                      ),
                       SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 9.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: const Color(0xff908FEC),
                        ),
                      ),
                       SizedBox(
                        width: 5.w,
                      ),
                       Text(
                        'BA: 9%',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff121826),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container smallContainer(String text, Color color, Color textColor) {
    return Container(
      padding:  EdgeInsets.only(left: 10.w, top: 0),
      height: 18.h,
      width: 60.w,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SvgPicture.asset('asset/images/triangle.svg'),
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

  Row intro(user) {
    return Row(
      children: [
        Container(
          height: 47.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.w),
            color: const Color(0xff908FEC),
          ),
          child:  Center(
              child: Text(
            '${user?.displayName}'.substring(0, 1).toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 25.sp),
          )),
        ),
         Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, ${user?.displayName}!",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03314B)),
              ),
              Text(
                'Welcome to Tradebase',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8198A5)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
