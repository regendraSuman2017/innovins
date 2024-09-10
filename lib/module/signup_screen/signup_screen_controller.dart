import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovins/data/repository/login/login_repo.dart';
import 'package:innovins/data/repository/login/login_repo_impl.dart';
import 'package:innovins/data/repository/sign_repo/sign_up_repo.dart';
import 'package:innovins/data/repository/sign_repo/sign_up_repo_impl.dart';
import 'package:innovins/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignUpScreenController extends GetxController{

  late SignUpRepo _signUpRepo;
  late LoginRepo _loginRepo;

  SignUpScreenController() {
    _signUpRepo = Get.put(SignUpRepoImpl());
    _loginRepo = Get.put(LoginRepoImpl());
  }


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


  void addProduct() async {
print("fsjkl 1");
    try {
      print("fsjkl 2");
      String  name =  nameController.text;
      String email =  emailController.text;
      String mobile =  phoneController.text;
      String password =  passwordController.text;
      isSigningUp.value = true;
      print("fsjkl 3");
      final result = await _signUpRepo.signUpAPI( name, email, mobile, password);
      if(result!=null && result.title=='Congratulations!'){
        loginAPI();
      }else{
      }
    } catch (e) {
      Navigator.of(Get.context!).pop();
      Get.snackbar(
        "Failed",
        "This E-mail Id Already Exist",
        icon: const Icon(Icons.clear, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
     // Fluttertoast.showToast(msg: "Some error happened");
    }
  }

  loginAPI()async{
    print("fsjkl 9");
    String  emailId = emailController.text;
    String password = passwordController.text;
    try{
      final response = await _loginRepo.loginAPI(emailId,password);
      if(response!=null && response.title=='Logged In!'){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_token',response.data!.userToken!);
        prefs.setString('name', response.data!.name!);
        prefs.setString('mobile', response.data!.mobile!);
        prefs.setString('email', response.data!.email!);

        Get.offAllNamed(Routes.dashBoardScreen);
        print("fsjkl 3");
      }

    }catch(e){}
  }


}