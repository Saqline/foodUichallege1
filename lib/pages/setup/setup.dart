import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_ui_challenge/pages/auth/log_in.dart';
import 'package:food_app_ui_challenge/pages/setup/slider.dart';


class Setup extends StatefulWidget {
  Setup({Key? key}) : super(key: key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  int _currentPage = 0;
  PageController _controller = PageController();

  // ignore: prefer_final_fields
  List<Widget> _pages = [
    SliderP(
        title: "WIDE VARIETY OF FOOD",
        desc: "Explore our Different variety of foods",
        short: "best for you",
        image: "assets/slider_image1.png"),
    SliderP(
        title: "FAST DELIVERY",
        desc: "Fast delivery with a few miniutes",
        short: "of ordering",
        image: "assets/slider_image2.png"),
    SliderP(
        title: "TASTY AND YUMMY",
        desc: "Freshly prepared with the best recipe to",
        short: "give a very sweet taste",
        image: "assets/slider_image3.png"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Positioned(
            top: 550.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: 10.h,
                          width: (index == _currentPage) ? 20.w : 10.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 24.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Color.fromARGB(255, 83, 17, 190)
                                  : Colors.green));
                    })),
                InkWell(
                  onTap: () {
                    (_currentPage == (_pages.length - 1))
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  LogIn(),
                            ))
                        : _controller.nextPage(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOutQuint);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 54.h,
                      width:
                          (_currentPage == (_pages.length - 1)) ? 150.w : 150.w,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(32)),
                      child: (_currentPage == (_pages.length - 1))
                          ? Text(
                              "GET STARTED",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-Light'),
                            )
                          : Text(
                              'NEXT ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}