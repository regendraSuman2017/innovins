import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/globals.dart';
import 'package:innovins/core/icons.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/core/widgets/custom_elevated_button.dart';
import 'package:innovins/core/widgets/text_Form_Field_Component.dart';
import 'package:innovins/module/login_screen/login_screen_controller.dart';
import 'package:innovins/routes/app_pages.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return formView(Get.find<LoginScreenController>());
  }

    Widget formView(LoginScreenController loginController) {
    return  Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: loginController.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [

                  SizedBox(height:Get.height*0.01),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget("Email Id"),
                      SizedBox(height:Get.height*0.01),
                      TextFieldComponent(
                        hintText: 'Enter Email',
                        contentPadding:EdgeInsets.all(Get.height * 0.025),
                        controller: loginController.phoneController,

                      ),
                    ],
                  ),

                  SizedBox(height:Get.height*0.03),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget("Password"),
                      SizedBox(height:Get.height*0.01),
                     Obx(()=> TextFieldComponent(
                        hintText: 'Enter password',
                        contentPadding:EdgeInsets.all(Get.height * 0.025),
                        controller: loginController.passwordController,
                       obscureText: loginController.passwordVisibility.value?false:true,
                        suffixIcon: IconButton(
                          onPressed: (){
                            loginController.passwordToggle();
                          },
                          icon: loginController.passwordVisibility.value?AppIcons.backIcon:AppIcons.eyeOffIcon,
                        ),
                      ),
        ),
                    ],
                  ),
                  SizedBox(height:Get.height*0.01),
                ],
              ),

              SizedBox(height:Get.height*0.02),

              SizedBox(
                  width: Get.width - 20,
                  height: Get.height * 0.07,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Log In',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w900,
                          fontSize: Get.height * 0.030,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      CustomElevatedButton(title: 'Login',
                          onPress: () async {
                            final isValid = loginController.loginFormKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }
                            loginController.loginUser();
                            return;
                          }

                      ),
                    ],
                  )
              ),
              SizedBox(height:Get.height*0.014),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: GoogleFonts.nunitoSans(
                        color: Colors.black54,
                        fontWeight: AppFontWeight.fontSemiBold,
                        letterSpacing: letterSpacing,
                        fontSize:Get.width*0.04,
                        decoration: TextDecoration.none,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign up',
                            style: GoogleFonts.nunitoSans(
                                color: AppColor.buttonColor,
                                fontWeight: AppFontWeight.fontBold),
                          recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.signUpScreenView),
                        ),
                      ],
                    ),

                  ),
                ],
              ).paddingSymmetric(vertical: Get.height*0.07),
            ],
          ),
        ),
      ),
    );
  }

  Widget textWidget(String? title){
    return Text(title!,style: GoogleFonts.nunitoSans(
        color: Colors.black54,
        fontSize: Get.width*0.045,fontWeight: AppFontWeight.fontSemiBold),);
  }
}
