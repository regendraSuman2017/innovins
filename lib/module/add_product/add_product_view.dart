import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/core/theme/app_text.dart';
import 'package:innovins/core/widgets/custom_elevated_button.dart';
import 'package:innovins/core/widgets/text_Form_Field_Component.dart';
import 'package:innovins/module/add_product/add_product_controller.dart';

class AddProductView extends GetView<AddProductController>{
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    double widthSize = Get.width;
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          leading: IconButton(
            icon: const Icon(Icons.clear),
            color: AppColor.primaryColor,
            onPressed: (){
              Get.back();
            },
          ).paddingOnly(left: 10),
          elevation: 0,
        ),


        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppText.addProduct,style: GoogleFonts.nunitoSans(fontSize: Get.width*0.06,fontWeight: AppFontWeight.fontBold),),
            SizedBox(height: Get.height*0.02,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: controller.appProductFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.textWidget(AppText.productName),
                            TextFieldComponent(
                              hintText: AppText.enterProductName,
                              obscureText: false,
                              contentPadding:EdgeInsets.all(Get.width * 0.023),
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s'),),
                              ],
                              controller: controller.productNameController,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return AppText.enterProductName;
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
                            controller.textWidget(AppText.moq),
                            TextFieldComponent(
                              hintText: AppText.enterMoq,
                              contentPadding:EdgeInsets.all(Get.height * 0.025),
                              controller: controller.mpqController,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return AppText.enterMoq;
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
                            controller.textWidget(AppText.price),
                            TextFieldComponent(
                              hintText: AppText.enterPrice,
                              obscureText: false,
                              contentPadding:EdgeInsets.all(Get.width * 0.023),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s'),),
                              ],
                              controller: controller.priceController,
                              validator: (String? value) {
                                if(value!.isEmpty){
                                  return AppText.enterPrice;
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
                            controller.textWidget(AppText.discount),
                            TextFieldComponent(
                              hintText: AppText.enterDiscount,
                              contentPadding:EdgeInsets.all(Get.height * 0.025),
                              controller: controller.discountPriceController,
                              validator: (String? value) {
                                if(value!.isEmpty){
                                  return AppText.enterDiscount;
                                }
                                return null;
                              },
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
                        child:CustomElevatedButton(title: AppText.submit,
                            onPress: () async {
                              final isValid = controller.appProductFormKey.currentState?.validate();
                              if (!isValid!) {
                                return;
                              }
                              controller.addProduct();
                              return;
                            }

                        )
                    ),

                  ],
                ),
              ),
            )
          ],
        ).paddingSymmetric(horizontal:
             widthSize*0.035
            ),
      )
    );

  }
}