import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app_ui_challenge/pages/post_auth/cart.dart';
import 'package:food_app_ui_challenge/pages/post_auth/home.dart';
import 'package:food_app_ui_challenge/pages/post_auth/message.dart';
import 'package:food_app_ui_challenge/pages/post_auth/profile.dart';
import 'package:food_app_ui_challenge/pages/post_auth/scan.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> pages = [
    Home(),
    Message(),
    Scan(),
    Cart(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              label: 'Home'
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.message,color: Colors.black,),
              label: 'Message'
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.scanner,color: Colors.black,),
              label: 'Scanner'
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              label: 'Cart'
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black,),
              label: 'Profile'
            ),
          ]),
    );
  }
}
