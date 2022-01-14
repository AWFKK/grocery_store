// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:n_store/Helper/constants.dart';
import 'package:n_store/Screen/TabBarScreens/Dashboard/Dashboard.dart';
import 'package:n_store/Screen/TabBarScreens/Orders/Order.dart';
import 'package:n_store/Screen/TabBarScreens/Profile/Profile.dart';
import 'package:n_store/styles/colors.dart';



class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {

  int currentIndex = 0;

  final List<Widget> _children = [
    DashboardScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(myAppName, style:TextStyle(color: AppColors.darkGrey)),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search_icon.svg",
              // By default our  icon color is white
              color: AppColors.themeColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart_icon.svg",
              // By default our  icon color is white
              color: AppColors.themeColor,
            ),
            onPressed: () {
              print('Cart Tab Bar');
            },
          ),
          const SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: _children[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.themeColor,

            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon:  Icon(Icons.home, size: 25),
                  activeIcon:  Icon(Icons.home, size: 30),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon:  Icon(Icons.local_shipping, size: 25),
                  activeIcon: Icon(Icons.local_shipping, size: 30),
                  label: 'Order'),
              BottomNavigationBarItem(
                  icon:  Icon(Icons.person, size: 25),
                  activeIcon:
                  Icon(Icons.person,  size: 30),
                  label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
