import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/screens/dashboard/portfolio/portfoluio_screen.dart';

class DetailScreen extends StatefulWidget {
  final String? name;
  final String? image;
  final String? amount;
  final String? subname;
  final String? percentage;
  const DetailScreen(
      {Key? key,
      this.name,
      this.image,
      this.amount,
      this.subname,
      this.percentage})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _select = 0;
  final List _text = [
    'Open',
    'High',
    'Low',
    'Volume',
    'Avg.volume',
    'Market Cap'
  ];
  final List _number = [
    '224.54',
    '227.29',
    '224.10',
    '834,146',
    '1,461,009',
    '43.419B'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 25.w),
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
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.h,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 55.w,
                ),
                Text(
                  '${widget.name} Portfolio',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff03314B),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, top: 28.h, bottom: 28.h),
            child: Container(
              height: 50,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  color: Color(0xffFCDDEC)),
              child: Row(
                children: [
                  smallSelectedContainer(0, 'Chart'),
                  smallSelectedContainer(1, 'Summary'),
                  smallSelectedContainer(2, 'Live Trade'),
                ],
              ),
            ),
          ),
          _select == 0
              ? chart()
              : (_select == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, bottom: 25.h, right: 10.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(widget.image.toString()),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 15.w, right: 60.w),
                                child: RichText(
                                  text: TextSpan(
                                      text: widget.name,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff03314B)),
                                      children: [
                                        TextSpan(
                                          text: '(${widget.subname})',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff8198A5),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              smallContainer(widget.percentage.toString(),
                                  Color(0xffF61C7A), Color(0xffFFFFFF))
                            ],
                          ),
                        ),
                        Container(
                          height: 365.h,
                          //color: Colors.blue,
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.amount.toString(),
                                  style: TextStyle(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff03314B),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: '\$224',
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff03314B),
                                      ),
                                      children: [
                                        TextSpan(
                                            text: '.88',
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff8198A5),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: ' +2,02',
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xffF61C7A)),
                                              ),
                                              TextSpan(
                                                text: ' (Today)',
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff908FEC)),
                                              ),
                                            ]),
                                      ]),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.w,
                                      right: 0.w,
                                      top: 25.h,
                                      bottom: 20.h),
                                  child: SvgPicture.asset(
                                      'asset/images/summarychart.svg'),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.w, bottom: 15.h),
                                    child: Text(
                                      'Statistics',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff03314B),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 130.h,
                                  width: 330.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Color(0xffB8BFC4FF),
                                  ),
                                  child: GridView.builder(
                                    itemCount: 6,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 2.h,
                                            mainAxisSpacing: 0,
                                            crossAxisSpacing: 0),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Text(
                                            _text[index],
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          Text(_number[index],
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700
                                          ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, bottom: 10.h, top: 10.h),
                          child: Container(
                            // color: Colors.teal,
                            child: Row(
                              children: [
                                statisticsContainer(
                                  'Buy',
                                  Color(0xffF61C7A),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                statisticsContainer(
                                  'Sell',
                                  Color(0xff3500D4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(' ')),
        ],
      ),
    );
  }

  Column chart() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.amount.toString(),
          style: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xff03314B),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_drop_up_outlined,
              size: 40,
              color: Color(0xffF178B6),
            ),
            RichText(
              text: TextSpan(
                  text: '+2,02 (${widget.percentage.toString()})',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffF61C7A),
                  ),
                  children: [
                    TextSpan(
                      text: 'Today',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff908FEC),
                      ),
                    )
                  ]),
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.w, top: 30.h, bottom: 30.h),
          child: SvgPicture.asset('asset/images/statisticschart.svg'),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, bottom: 30.h),
            child: Text(
              'Statistics',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff03314B),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Row(
            children: [
              statisticsContainer(
                'Buy',
                Color(0xffF61C7A),
              ),
              SizedBox(
                width: 12.w,
              ),
              statisticsContainer(
                'Sell',
                Color(0xff3500D4),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container statisticsContainer(String text, Color color) {
    return Container(
      height: 48.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }

  GestureDetector smallSelectedContainer(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _select = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Container(
          height: 30.h,
          width: 90.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: _select == index ? Color(0xffFFFFFF) : Color(0xffFCDDEC)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color:
                      _select == index ? Color(0xffF61C7A) : Color(0xff03314B)),
            ),
          ),
        ),
      ),
    );
  }
}
