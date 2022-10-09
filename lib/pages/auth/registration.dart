import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_ui_challenge/pages/auth/log_in.dart';
import 'package:food_app_ui_challenge/pages/post_auth/bottom_nav_bar.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(top: 80.h,left: 20.w,right: 20.w),
            child: Column(
        children: [
            Text(
              'Create Account',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                  fontFamily: 'Poppins-Regular',
                  letterSpacing: .40),
            ),
            
            SizedBox(
              height: 50.h,
            ),
            // ignore: prefer_const_constructors
            TextField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                  hintText: 'Full Name',
                  prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(height: 10.h,),
            TextField(
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail)),
            ),
            SizedBox(
              height: 10.h,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 10.h,),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26)),
                hintText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  BottomNavBar(),
                        ));
                  },
                  child: Container(
                      height: 50.h,
                      width: 180.h,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20.h)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Registration',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )),
                )),
            const Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Wrap(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Already have a Account?\t'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  LogIn(),
                        ));
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
      ),
          )),
    );
  }
}