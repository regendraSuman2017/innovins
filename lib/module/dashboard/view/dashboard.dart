import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/module/dashboard/controller/dashboard_controller.dart';
import 'package:innovins/module/home_page/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// ignore: must_be_immutable
class Dashboard extends GetView<DashboardController> {
  @override
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 50,
      controller: controller.persistentTabController,
      screens:_buildScreens(),
      items: _navBarsItems(),
      //confineInSafeArea: true,
      confineToSafeArea: true,
      stateManagement: false,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
          boxShadow: [
             BoxShadow(
              color: AppColor.lightGrey,
              offset: Offset(
                0.0,
                -5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -5.0,
            ), //
          ]),
      navBarStyle: NavBarStyle.style13,

      onItemSelected: (value) async {},
    )
    ;
  }
}

List<Widget> _buildScreens() {
  return [
     const HomePage(),
    //const ProductCartScreen(),
    HomePage(),
    const HomePage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home,size: 25),
      title: "Home",
      activeColorPrimary: AppColor.primaryColor,
      inactiveColorPrimary: AppColor.primaryColor,

    ),

    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_basket ,size: 20),
      title: "cart",
      activeColorPrimary: AppColor.primaryColor,
      inactiveColorPrimary: AppColor.primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person,size: 20),
      title: "profile",
      activeColorPrimary: AppColor.primaryColor,
      inactiveColorPrimary: AppColor.primaryColor,
    ),
  ];
}


