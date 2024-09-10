import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/module/login_screen/login_screen_controller.dart';
import 'package:innovins/module/login_screen/widgets/enter_text_login.dart';
import 'package:innovins/module/login_screen/widgets/login_up_form.dart';

class LoginScreenView extends GetView<LoginScreenController>{
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          leading:const Text(""),
          backgroundColor: AppColor.customBlack,
          elevation: 0,
        ),
        body: Container(
          height: Get.height*0.9,
          color: AppColor.customBlack,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:  const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EnterTextLogin(),

              LoginWidget(),
            ],
          ),
        ),
      ),
    );

  }
}