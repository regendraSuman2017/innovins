import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/data/repository/login/login_repo.dart';
import 'package:innovins/data/repository/login/login_repo_impl.dart';
import 'package:innovins/routes/app_pages.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreenController extends GetxController{

  late LoginRepo _loginRepo;

  LoginScreenController() {
    _loginRepo = Get.find<LoginRepoImpl>();
  }


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

      final response = await _loginRepo.loginAPI(phoneController.text,passwordController.text);

      if(response!=null){
        Navigator.of(Get.context!).pop();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', true);
        prefs.setString('user_login_token', response.data!.userToken!);
        prefs.setString('name', response.data!.name!);
        prefs.setString('mobile', response.data!.mobile!);
        prefs.setString('email', response.data!.email!);


        await Future.delayed(const Duration(seconds: 1));
       Get.offAllNamed(Routes.dashBoardScreen);
      }




    } catch (e) {
      Navigator.of(Get.context!).pop();
      await Future.delayed(const Duration(seconds: 1));

    }
  }




}