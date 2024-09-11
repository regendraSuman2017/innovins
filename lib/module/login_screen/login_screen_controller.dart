import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/core/widgets/snackbar_widget.dart';
import 'package:innovins/routes/app_pages.dart';
import 'package:innovins/service/api_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreenController extends GetxController{



  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode? focusNode;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    focusNode!.dispose();
    super.dispose();
  }

  RxBool isSigningUp = false.obs;
  RxBool passwordVisibility = false.obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    focusNode = FocusNode();
  }
  void passwordToggle() {
    passwordVisibility.value = passwordVisibility.value ? false : true;
  }



  void loginUser() async {
    showDialog(
        context: Get.context!,
        builder: (BuildContext _) => Center(
          child: LoadingAnimationWidget.threeArchedCircle(
            color: const Color.fromARGB(255, 255, 177, 41),
            size: Get.width*0.12,
          ),
        )
    );
    try {

      var response = await ApiService().login(phoneController.text,passwordController.text);

      if(response!=null ){
        Navigator.of(Get.context!).pop();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', true);
        prefs.setString('user_login_token', response.data!.userToken!);
        prefs.setString('name', response.data!.name!);
        prefs.setString('mobile', response.data!.mobile!);
        prefs.setString('email', response.data!.email!);

        await Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed(Routes.dashBoardScreen);
      }else{
        Navigator.of(Get.context!).pop();
        CustomSnackBar.showFailedSnackBar('Failed','Failed');
      }
    } catch (e) {
      Navigator.of(Get.context!).pop();
      CustomSnackBar.showFailedSnackBar('Failed','Failed');
    }
  }


  }

