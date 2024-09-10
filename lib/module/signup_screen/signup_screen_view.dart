import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/module/signup_screen/signup_screen_controller.dart';
import 'package:innovins/module/signup_screen/widgets/enter_text.dart';
import 'package:innovins/module/signup_screen/widgets/sign_up_form.dart';

class SignUpScreenView extends GetView<SignUpScreenController>{
  const SignUpScreenView({super.key});

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
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EnterYourMobileText(),
              SizedBox(
                height: Get.height*0.04,
              ),
              const SignUpFormWidget(),
            ],
          ),
        ),
      ),
    );

  }
}