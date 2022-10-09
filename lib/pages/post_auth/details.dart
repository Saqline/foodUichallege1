import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Details extends StatefulWidget {
  Details(
      {Key? key, this.description, this.img, this.name, this.price})
      : super(key: key);
      
      String? img;
      String? name;
      String? description;
      double? price;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Image.asset(
                  '${widget.img}',
                  height: 320.h,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.name}',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-Regular'),
                ),
                Text(
                  '\$ ${widget.price}',
                  style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '${widget.description}',
              style: TextStyle(fontSize: 18.sp),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Icon(Icons.lock_clock),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Delivery Time',
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '30 min',
                  style: TextStyle(fontSize: 18.sp),
                )
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            Stack(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20.h,
                        backgroundColor: Colors.grey,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              i--;
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        '$i',
                        style: TextStyle(fontSize: 25.sp),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      CircleAvatar(
                        radius: 20.h,
                        backgroundColor: Colors.red,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              i++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        height: 50.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                            child: Text(
                          'Add to Cart',
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        )),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}