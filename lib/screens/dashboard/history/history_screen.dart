import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/screens/dashboard/history/calendar_screen.dart';
import 'package:trading_app/widgets/common_widgets/common_button.dart';
import '../home/product.dart';
import '../portfolio/view_all/viewall_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _select = true;
  List<Product> products = allProducts;
  Future<void> _selectContainer(value) async {
    setState(() {
      _select = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding:  EdgeInsets.only(top: 45.h, left: 25.w,right: 25.w),
            child: Row(
              children: [
                 Text(
                  'Order History',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03314B),
                  ),
                ),
                 SizedBox(width: 140.w,),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarScreen(),));
                    },
                    child: SvgPicture.asset('asset/images/calendar.svg')),
              ],
            ),
          ),
          Padding(
            padding:
                 EdgeInsets.only(left: 25.w, right: 25.w, top: 30.h, bottom: 30.h),
            child: Container(
              height: 45.h,
              width: 330.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                color: const Color(0xffFCDDEC),
              ),
              child: Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 10.w, right: 8.w),
                    child: GestureDetector(
                      onTap: () => _selectContainer(true),
                      child: Container(
                        height: 30.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: _select == true
                                ? const Color(0xffFFFFFF)
                                : const Color(0xffFCDDEC)),
                        child: Center(
                          child: Text(
                            'Order',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: _select == true
                                  ? const Color(0xffF61C7A)
                                  : const Color(0xff03314B),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectContainer(false),
                    child: Padding(
                      padding:  EdgeInsets.only(right: 10.w),
                      child: Container(
                        height: 30.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.w),
                            color: !_select == true
                                ? const Color(0xffFFFFFF)
                                : const Color(0xffFCDDEC)),
                        child: Center(
                          child: Text(
                            'Histroy',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: !_select == true
                                    ? const Color(0xffF61C7A)
                                    : const Color(0xff03314B)),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          _select == true
              ? order()
              : Padding(
                  padding:  EdgeInsets.only(left: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        'Recent Order',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: Color(0xff121826)),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                       Text(
                        'Today, 27 Aug 2021',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp,
                            color: Color(0xff6C727F)),
                      ),
                      SizedBox(
                        height: 402.h,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: products.length,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Padding(
                              padding:  EdgeInsets.only(bottom: 23.h),
                              child: topstocksrow(
                                product.image.toString(),
                                product.title.toString(),
                                product.subtitle.toString(),
                                product.chart.toString(),
                                product.amount.toString(),
                                product.percentage.toString(),
                                product.color as Color,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }

  Column order() {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding:  EdgeInsets.only(top: 65.h, bottom: 30.h),
            child: SvgPicture.asset('asset/images/order.svg'),
          ),
        ),
         Text(
          'Not Yet Ordered',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Color(0xff03314B)),
        ),
         SizedBox(
          height: 15.h,
        ),
         Text(
          'There is no recent stock you order,',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: Color(0xff6C727F)),
        ),
         Text(
          'let’s make your first investment!',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: Color(0xff6C727F)),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 24.w, right: 24.w, top: 45.h),
          child: CommonButtons(
            onPressed: () {},
            color: const Color(0xff4210e1),
            child:  Text(
              'View Stock',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: Color(0xffFFFFFF)),
            ),
          ),
        )
      ],
    );
  }
}
