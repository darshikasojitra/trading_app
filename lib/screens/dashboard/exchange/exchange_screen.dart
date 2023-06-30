import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/screens/dashboard/exchange/buy_stock/buy_stock._screen.dart';
import 'package:trading_app/widgets/common_widgets/common_button.dart';
import 'dart:math' as math;

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  bool _select = true;
  String _selectedValue = 'AAPL (Apple Inc.)';
  String _sellSelectedValue = 'Spotify';
  final _controller = TextEditingController();
  Future<void> _selectContainer(value) async {
    setState(() {
      _select = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 45.h, left: 25.w),
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
                    width: 70.w,
                  ),
                  Text(
                    'Exchange',
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
              child: buyandsellContainer(),
            ),
            _select == true
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 22.h, bottom: 0),
                        child: Stack(
                          children: [
                            exchangeContainer(),
                            Padding(
                              padding: EdgeInsets.only(left: 130.w, top: 100.h),
                              child: MyArc(
                                diameter: 50,
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: FloatingActionButton.small(
                          backgroundColor: const Color(0xffec76a4ff),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.w)),
                          onPressed: () {},
                          child: const Icon(Icons.autorenew_rounded),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 0, bottom: 10.h),
                        child: Container(
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color(0xffF4F4F6),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 24.w, top: 22.h, right: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _sellSelectedValue,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff03314B)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15.h),
                                  child: Row(
                                    children: [
                                      DropdownButton(
                                        underline: Container(),
                                        value: _sellSelectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _sellSelectedValue =
                                                value.toString();
                                          });
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            value: 'AAPL (Apple Inc.)',
                                            child: SvgPicture.asset(
                                                'asset/images/apple.svg'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Twitter Inc.',
                                            child: SvgPicture.asset(
                                                'asset/images/twiterlogo.svg'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'GOOGL',
                                            child: SvgPicture.asset(
                                                'asset/images/google.svg'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Nike, Inc.',
                                            child: SvgPicture.asset(
                                                'asset/images/nike.svg'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Microsoft',
                                            child: SvgPicture.asset(
                                                'asset/images/microsoft.svg'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Facebook, Inc',
                                            child: SvgPicture.asset(
                                                'asset/images/facebook.svg'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Spotify',
                                            child: SvgPicture.asset(
                                                'asset/images/spotify.svg'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      const Text('\$145.90')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 28.h, bottom: 10.h),
                        child: CommonButtons(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyStocksScreen(
                                    amount: _controller.text,
                                    name: _selectedValue,),
                              ),
                            );
                          },
                          color: const Color(0xff3500D4),
                          child: Text(
                            'Buy $_selectedValue',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFFFFFF)),
                          ),
                        ),
                      )
                    ],
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }

  Container buyandsellContainer() {
    return Container(
      height: 45.h,
      width: 330.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: const Color(0xffFCDDEC)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 5.w),
            child: GestureDetector(
              onTap: () => _selectContainer(true),
              child: Container(
                height: 30.h,
                width: 140.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: _select == true
                      ? const Color(0xffFFFFFF)
                      : const Color(0xffFCDDEC),
                ),
                child: Center(
                  child: Text(
                    'Buy',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: _select == true
                            ? const Color(0xffF61C7A)
                            : const Color(0xff03314B)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () => _selectContainer(false),
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
                    'Sell',
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
    );
  }

  Container exchangeContainer() {
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.w),
        color: Color(0xffF4F4F6),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedValue,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff03314B)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                children: [
                  DropdownButton(
                    underline: Container(),
                    value: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value.toString();
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'AAPL (Apple Inc.)',
                        child: SvgPicture.asset('asset/images/apple.svg'),
                      ),
                      DropdownMenuItem(
                        value: 'Twitter Inc.',
                        child: SvgPicture.asset('asset/images/twiterlogo.svg'),
                      ),
                      DropdownMenuItem(
                        value: 'GOOGL',
                        child: SvgPicture.asset('asset/images/google.svg'),
                      ),
                      DropdownMenuItem(
                        value: 'Nike, Inc.',
                        child: SvgPicture.asset('asset/images/nike.svg'),
                      ),
                      DropdownMenuItem(
                        value: 'Microsoft',
                        child: SvgPicture.asset('asset/images/microsoft.svg'),
                      ),
                      DropdownMenuItem(
                        value: 'Facebook, Inc',
                        child: SvgPicture.asset('asset/images/facebook.svg'),
                      ),
                      DropdownMenuItem(
                        value: 'Spotify',
                        child: SvgPicture.asset('asset/images/spotify.svg'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controller,
                      // decoration: const InputDecoration(
                      //   suffixIcon: Icon(Icons.calculate,color: Color(0xffD8D8D8),)
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({super.key, this.diameter = 200});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
      //border
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
