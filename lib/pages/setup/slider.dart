import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderP extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final String short;
  SliderP({
    required this.image,
    required this.title,
    required this.desc,
    required this.short,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsets.only(top: 40.h,left: 20.h,right: 20.h),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 30.h),
              child: Center(
                child: Image.asset(
                  image,
                  height: 300.h,
                  width: 185.w,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Poppins-Light',
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Center(
                child: Text(
                  desc,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Poppins-Light',
                      color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 2.h),
              child: Center(
                child: Text(
                  short,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'Poppins-Light',
                      color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
