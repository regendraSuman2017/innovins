import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/globals.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/core/theme/app_text.dart';
import 'package:innovins/core/widgets/custom_elevated_button.dart';
import 'package:innovins/core/widgets/text_Form_Field_Component.dart';
import 'package:innovins/module/signup_screen/signup_screen_controller.dart';
import 'package:innovins/routes/app_pages.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return formView(Get.find<SignUpScreenController>());
  }

    Widget formView(SignUpScreenController signUpController) {
    return  Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: signUpController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(AppText.nameText),
                      TextFieldComponent(
                        hintText: AppText.enterNameText,
                        obscureText: false,
                        contentPadding:EdgeInsets.all(Get.width * 0.023),
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s'),),
                        ],
                        controller: signUpController.nameController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return AppText.enterNameText;
                          }
                          return null;
                        },

                      ),
                    ],
                  ),
                  SizedBox(height:Get.height*0.01),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(AppText.phoneText),
                      TextFieldComponent(
                        hintText: AppText.enterPhoneNumber,
                        contentPadding:EdgeInsets.all(Get.height * 0.025),
                        controller: signUpController.phoneController,
                        keyboardType: TextInputType.number,
                        validator: (value){
                          if(value!.isEmpty){
                            return AppText.enterPhoneNumber;
                          }
                          return null;
                        },

                      ),
                    ],
                  ),
                  SizedBox(height:Get.height*0.01),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(AppText.emailText),
                      TextFieldComponent(
                        hintText: AppText.enterEmailText,
                        obscureText: false,
                        contentPadding:EdgeInsets.all(Get.width * 0.023),
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s'),),
                        ],
                        controller: signUpController.emailController,

                      ),
                    ],
                  ),
                  SizedBox(height:Get.height*0.01),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget("Password"),
                      TextFieldComponent(
                        hintText: 'Enter password',
                        contentPadding:EdgeInsets.all(Get.height * 0.025),
                        controller: signUpController.passwordController,

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
                        'Signup',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w900,
                          fontSize: Get.height * 0.030,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      CustomElevatedButton(title: 'Signup',
                          onPress: () async {
                            final isValid = signUpController.formKey.currentState?.validate();
                            if (!isValid!) {
                              return;
                            }
                            signUpController.signup();
                            return;
                          }

                      ),
                    ],
                  )
              ),
              SizedBox(height:Get.height*0.014),

              SizedBox(height:Get.height*0.01),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.nunitoSans(
                        color: Colors.black54,
                        fontWeight: AppFontWeight.fontSemiBold,
                        letterSpacing: letterSpacing,
                        fontSize:Get.width*0.04,
                        decoration: TextDecoration.none,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log In',
                          style: GoogleFonts.nunitoSans(
                              color: AppColor.buttonColor,
                              fontWeight: AppFontWeight.fontBold),
                          recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.loginScreen),
                        ),
                      ],
                    ),

                  ),


                ],
              ),
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
