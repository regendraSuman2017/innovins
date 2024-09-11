import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/core/widgets/snackbar_widget.dart';
import 'package:innovins/routes/app_pages.dart';
import 'package:innovins/service/api_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class SignUpScreenController extends GetxController{



  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  RxBool isSigningUp = false.obs;


  void signup() async {
    try {
      showDialog(
          context: Get.context!,
          builder: (BuildContext _) => Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              color: const Color.fromARGB(255, 255, 177, 41),
              size: Get.width*0.12,
            ),
          )
      );
      String  name =  nameController.text;
      String email =  emailController.text;
      String mobile =  phoneController.text;
      String password =  passwordController.text;
      isSigningUp.value = true;

      var response = await ApiService().register(name, email, mobile, password);

      if(response!=null && response.title=='Congratulations!'){
        Navigator.of(Get.context!).pop();
        CustomSnackBar.showSuccessSnackBar('Success','Account Create successful. please Login');
        Future.delayed(const Duration(seconds: 2));
        Get.offAllNamed(Routes.loginScreen);
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