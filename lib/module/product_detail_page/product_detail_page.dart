import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/localdatabase/product_cart_list.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/module/product_detail_page/product_detail_controller.dart';


class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() =>
        controller.isLoading.value ? const Center(
          child: CircularProgressIndicator(),) :
        Container(
          height: Get.height * 0.99999,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img1.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.6,
                decoration: const BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.title.toString(),
                      style: GoogleFonts.nunitoSans(
                          fontWeight: AppFontWeight.fontBold,
                          fontSize: Get.width * 0.08,
                          color: AppColor.black
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: controller.price.value,
                        style: GoogleFonts.nunitoSans(
                            fontSize: Get.width * 0.05,
                            color: AppColor.black,
                            fontWeight: AppFontWeight.fontBold
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' \$ /piece',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: Get.width * 0.04,
                                  color: AppColor.darkGrey
                              )),
                        ],
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        text: '~ ${controller.price.value}',
                        style: GoogleFonts.nunitoSans(
                            fontSize: Get.width * 0.05,
                            color: AppColor.buttonColor,
                            fontWeight: AppFontWeight.fontBold
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' gr /piece',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: Get.width * 0.04,
                                  color: AppColor.buttonColor
                              )),
                        ],
                      ),
                    ),

                    Text(
                      'Spain',
                      style: GoogleFonts.nunitoSans(
                          fontWeight: AppFontWeight.fontBold,
                          fontSize: Get.width * 0.05,
                          color: AppColor.black
                      ),
                    ),

                    SizedBox(
                      width: Get.width,
                      child: Text(
                        'Lettue is an annual plant of the  daisy family Asteracease. it is  mpost oftern grown  as a leafe begatable  but somthing  for its stem and seeds. lettitute is most  odfte used salads although it is  laso seeninother kinds of food such as soups, sandwiches and wrap: it can laso be grilled',
                        style: GoogleFonts.nunitoSans(
                            fontWeight: AppFontWeight.fontBold,
                            fontSize: Get.width * 0.045,
                            color: AppColor.customBlack
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {

                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColor.whiteColor,
                            side: const BorderSide(
                                color: AppColor.darkGrey, width: 1.5),
                            // Border color and width
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5.0), // Border radius
                            ),
                          ),
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: AppColor.darkGrey,
                            size: Get.width * 0.06,
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            ProductCartListOffline product = ProductCartListOffline(
                              productId: controller..id,
                              moq: controller.moq.value,
                              name: controller.title.value,
                              price: controller.price.value,
                              discountedPrice: controller.discount.value,
                              quantity: 1,
                            );
                            await product.save().then((value) {
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColor.buttonColor,
                            // Text color
                            side: const BorderSide(
                                color: Colors.blue, width: 1.5),
                            // Border color and width
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5.0), // Border radius
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart, color: AppColor.whiteColor,
                                size: Get.width * 0.06,),
                              Text("Add to cart".toUpperCase(),
                                style: GoogleFonts.nunitoSans(
                                    color: AppColor.whiteColor,
                                    fontWeight: AppFontWeight.fontRegular
                                ),).paddingOnly(left: 10)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ).marginOnly(top: 30).paddingSymmetric(horizontal: 20),
              ),

            ],
          ),
        ),
        )
    );
  }

}