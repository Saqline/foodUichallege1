import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app_ui_challenge/models/food_model.dart';
import 'package:food_app_ui_challenge/pages/post_auth/details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var item_list = ['PIZZA', 'BURGER', 'DRINKS', 'SNACKS', 'COMBO'];
  PageController _pageController = PageController();
  int selectedIndex = 0;
  double _ratingValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text('Home',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, top: 18.h),
            child: Stack(children: [
              Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              Positioned(
                  right: 0.w,
                  child: CircleAvatar(
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8.sp),
                    ),
                    minRadius: 8.sp,
                    backgroundColor: Colors.red,
                  )),
            ]),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 5.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50.h,
                  width: 300.w,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                    width: 30.h,
                    color: Colors.black,
                    child: Icon(
                      Icons.line_weight,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              
              height: 50.h,
              width: 350,
              child: ListView.builder(
                  itemCount: item_list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          _pageController.jumpToPage(index);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10.h),
                        height: 50.h,
                        child: Center(child: Text(item_list[index],style: TextStyle(fontSize: 18.sp,color: Colors.black),)),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: PageView(
              controller: _pageController,
              children: [
                Container(
                  color: Colors.white,
                  child: Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 220,
                                  childAspectRatio: 5 / 8,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: pizzaList.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                              img: pizzaList[index].img,
                                              name: pizzaList[index].name,
                                              price: pizzaList[index].price,
                                              description: pizzaList[index].description,
                                            )));
                                  },
                                  child: Card(
                                    child: Container(
                                      height: 240.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: Image.asset('${pizzaList[index].img}',height: 95.h,width: 100.h,),
                                            ),
                                          ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 5.h,left: 10.w,right: 10.w),
                                              child: Text('${pizzaList[index].name}',style: TextStyle(fontSize: 16.sp),),
                                            ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(height: 10.h,),
                                            Padding(
                                              padding:  EdgeInsets.only(bottom: 10.h,left: 10.w,right: 10.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${pizzaList[index].price}',style: TextStyle(fontWeight: FontWeight.bold),),
                                                  CircleAvatar(child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.red,radius: 15,)

                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(child: Icon(Icons.favorite_outline),top: 5.h,right: 8.w,)
                              ],
                            );
                          })),
                ),
                Container(
                  color: Colors.white,
                  child: Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 220,
                                  childAspectRatio: 5 / 8,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: burgerList.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                              img: burgerList[index].img,
                                              name: burgerList[index].name,
                                              price: burgerList[index].price,
                                              description: burgerList[index].description,
                                            )));
                                  },
                                  child: Card(
                                    child: Container(
                                      height: 240.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: Image.asset('${burgerList[index].img}',height: 95.h,width: 100.h,),
                                            ),
                                          ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 5.h,left: 10.w,right: 10.w),
                                              child: Text('${burgerList[index].name}',style: TextStyle(fontSize: 16.sp),),
                                            ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(height: 10.h,),
                                            Padding(
                                              padding:  EdgeInsets.only(bottom: 10.h,left: 10.w,right: 10.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${burgerList[index].price}',style: TextStyle(fontWeight: FontWeight.bold),),
                                                  CircleAvatar(child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.red,radius: 15,)

                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(child: Icon(Icons.favorite_outline),top: 5.h,right: 8.w,)
                              ],
                            );
                          })),
                ),
                Container(
                  color: Colors.white,
                  child: Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 220,
                                  childAspectRatio: 5 / 8,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: drinkstList.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                              img: drinkstList[index].img,
                                              name: drinkstList[index].name,
                                              price: drinkstList[index].price,
                                              description: drinkstList[index].description,
                                            )));
                                  },
                                  child: Card(
                                    child: Container(
                                      height: 240.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: Image.asset('${drinkstList[index].img}',height: 95.h,width: 100.h,),
                                            ),
                                          ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 5.h,left: 10.w,right: 10.w),
                                              child: Text('${drinkstList[index].name}',style: TextStyle(fontSize: 16.sp),),
                                            ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(height: 10.h,),
                                            Padding(
                                              padding:  EdgeInsets.only(bottom: 10.h,left: 10.w,right: 10.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${drinkstList[index].price}',style: TextStyle(fontWeight: FontWeight.bold),),
                                                  CircleAvatar(child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.red,radius: 15,)

                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(child: Icon(Icons.favorite_outline),top: 5.h,right: 8.w,)
                              ],
                            );
                          })),
                ),
                Container(
                  color: Colors.white,
                  child: Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 220,
                                  childAspectRatio: 5 / 8,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: snacksList.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                              img: snacksList[index].img,
                                              name: snacksList[index].name,
                                              price: snacksList[index].price,
                                              description: snacksList[index].description,
                                            )));
                                  },
                                  child: Card(
                                    child: Container(
                                      height: 240.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: Image.asset('${drinkstList[index].img}',height: 95.h,width: 100.h,),
                                            ),
                                          ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 5.h,left: 10.w,right: 10.w),
                                              child: Text('${snacksList[index].name}',style: TextStyle(fontSize: 16.sp),),
                                            ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(height: 10.h,),
                                            Padding(
                                              padding:  EdgeInsets.only(bottom: 10.h,left: 10.w,right: 10.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${snacksList[index].price}',style: TextStyle(fontWeight: FontWeight.bold),),
                                                  CircleAvatar(child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.red,radius: 15,)

                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(child: Icon(Icons.favorite_outline),top: 5.h,right: 8.w,)
                              ],
                            );
                          })),
                ),
                Container(
                  color: Colors.white,
                  child: Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 220,
                                  childAspectRatio: 5 / 8,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: comboList.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                              img: comboList[index].img,
                                              name: comboList[index].name,
                                              price: comboList[index].price,
                                              description: comboList[index].description,
                                            )));
                                  },
                                  child: Card(
                                    child: Container(
                                      height: 240.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: Image.asset('${comboList[index].img}',height: 95.h,width: 100.h,),
                                            ),
                                          ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 5.h,left: 10.w,right: 10.w),
                                              child: Text('${comboList[index].name}',style: TextStyle(fontSize: 16.sp),),
                                            ),
                                          Padding(
                                              padding:  EdgeInsets.only(top: 15.h),
                                              child: RatingBar(
                                                  itemSize: 20.h,
                                                  initialRating: 3,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  ratingWidget: RatingWidget(
                                                      full: const Icon(
                                                          Icons.star,
                                                          color: Colors.orange),
                                                      half: const Icon(
                                                        Icons.star_half,
                                                        color: Colors.orange,
                                                      ),
                                                      empty: const Icon(
                                                        Icons.star_outline,
                                                        color: Colors.orange,
                                                      )),
                                                  onRatingUpdate: (value) {
                                                    setState(() {
                                                      _ratingValue = value;
                                                    });
                                                  }),
                                            ),
                                            SizedBox(height: 10.h,),
                                            Padding(
                                              padding:  EdgeInsets.only(bottom: 10.h,left: 10.w,right: 10.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${comboList[index].price}',style: TextStyle(fontWeight: FontWeight.bold),),
                                                  CircleAvatar(child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.red,radius: 15,)

                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(child: Icon(Icons.favorite_outline),top: 5.h,right: 8.w,)
                              ],
                            );
                          })),
                ),
                
              
              ],
            ))
          ],
        ),
      ),
    );
  }
}
