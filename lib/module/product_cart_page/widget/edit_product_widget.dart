import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/core/theme/app_text.dart';
import 'package:innovins/core/widgets/custom_elevated_button.dart';
import 'package:innovins/core/widgets/text_Form_Field_Component.dart';

import 'package:innovins/module/product_cart_page/product_cart_controller.dart';

class EditProductWidget extends StatelessWidget {
  const EditProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return addProductFormView(Get.find<ProductCartController>());
  }

  Widget addProductFormView(ProductCartController productController) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: productController.editProductFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(AppText.productName),
                    TextFieldComponent(
                      hintText: AppText.enterProductName,
                      obscureText: false,
                      contentPadding:EdgeInsets.all(Get.width * 0.023),
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s'),),
                      ],
                      controller: productController.productNameController,
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
                    textWidget(AppText.moq),
                    TextFieldComponent(
                      hintText: AppText.enterMoq,
                      contentPadding:EdgeInsets.all(Get.height * 0.025),
                      controller: productController.moqController,
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
                    textWidget(AppText.price),
                    TextFieldComponent(
                      hintText: AppText.enterPrice,
                      obscureText: false,
                      contentPadding:EdgeInsets.all(Get.width * 0.023),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s'),),
                      ],
                      controller: productController.priceController,
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
                    textWidget(AppText.discount),
                    TextFieldComponent(
                      hintText: AppText.enterDiscount,
                      contentPadding:EdgeInsets.all(Get.height * 0.025),
                      controller: productController.discountController,
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
                      final isValid = productController.editProductFormKey.currentState?.validate();
                      if (!isValid!) {
                        return;
                      }
                     productController.editProductAPI();
                      return;
                    }

                )
            ),

          ],
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
