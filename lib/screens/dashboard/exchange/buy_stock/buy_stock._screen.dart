import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/common_widgets/common_button.dart';

class BuyStocksScreen extends StatelessWidget {
  final String? amount;
  final String? name;
  const BuyStocksScreen({Key? key,this.amount,this.name,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List text =['\$1','\$10','\$50','\$100'];
    return Scaffold(
      body: Column(
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
                  'Buy $name',
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
            padding:  EdgeInsets.only(top: 120.h,left: 0.w,bottom: 100.h),
            child: Center(
              child: RichText(
                text: TextSpan(text: "\$$amount",
                    style: TextStyle(
                        color: Color(0xff03314B),
                        fontWeight: FontWeight.w700,
                        fontSize: 36.sp),
                children: [
                        TextSpan(text: '.20',style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: Color(0xff818080)
                        ))
                ]
                )
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 24.w,right: 24.w),
            child: Container(
              height: 30.h,
              width: double.infinity,
              //color: Colors.blue,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
               return Padding(
                 padding:  EdgeInsets.only(right: 10.w),
                 child: Container(
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(color: Color(0xff818080)),
                          color:Colors.white
                          //Color(0xffF4F4F6)
                        ),
                    child: Center(child: Text(text[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700
                    ),
                    )),
                      ),
               );
              },),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
                left: 24.w, right: 24.w, top: 250.h, bottom: 10.h),
            child: CommonButtons(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => BuyStocksScreen(),),);
              },
              color: const Color(0xff3500D4),
              child:  Text(
                'Buy',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
