import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/core/image_constant.dart';
import 'package:innovins/module/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(AppImage.splashScreen,fit: BoxFit.fitWidth,),
        // ast_img.splashUbiAirport
      ),
    );
  }
}