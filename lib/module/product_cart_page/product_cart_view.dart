import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/icons.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/core/theme/app_text.dart';
import 'package:innovins/module/product_cart_page/product_cart_controller.dart';

class ProductCartScreen extends GetView<ProductCartController> {
  const ProductCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKeyN = GlobalKey<ScaffoldState>(); // DRAWER
    double widthSize = Get.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKeyN,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: AppColor.whiteColor,
        actions: [
          InkWell(
              onTap: () async {
               controller.onInit();
              },
              child: const Icon(Icons.refresh)),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: AppColor.primaryColor,
          onPressed: (){
            if (scaffoldKeyN.currentState != null) {
              scaffoldKeyN.currentState!.openDrawer();
            }
          },
        ).paddingOnly(left: 10),
        elevation: 0,
      ),

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product Listing",style: GoogleFonts.nunitoSans(fontSize: Get.width*0.07,fontWeight: AppFontWeight.fontBold),),
            SizedBox(height: Get.height*0.02,),
            TextField(
              onChanged: (p0) {
                //controller.filterProductList(p0);
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  contentPadding: EdgeInsets.all(
                      widthSize*0.035
                        ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText:'Search here..',
                  labelStyle:  TextStyle(
                    fontSize:  widthSize*0.04
                      ,
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: AppIcons.searchIcon
              ),
            ).marginOnly(top: 10,bottom: 10),

            Obx(() => SizedBox(
              height: 400,
              child: controller.productList.isEmpty
                  ? const Center(child: Text("Empty"))
                  : ListView.builder(
                  itemCount: controller.productList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(top: widthSize * 0.03),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColor.buttonColor,  // Set the color of the left border
                                width: 4.0, // Set the width of the left border
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Name: ${controller.productList[index].name!}",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize:widthSize * 0.035,
                                        fontWeight: AppFontWeight.fontRegular,
                                      ),
                                    ),
                                    SizedBox(
                                      height:  widthSize * 0.02
                                         ,
                                    ),
                                    Text(
                                      "MOQ: ${controller.productList[index].moq!}",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize:widthSize * 0.035,
                                        fontWeight: AppFontWeight.fontRegular,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              // Vertical divider (border)
                              Container(
                                width: 1.5, // Border width
                                color: Colors.grey, // Border color
                                height: Get.width*0.12, // Make sure the border spans the full height
                              ).marginOnly(right: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${AppText.productName} ${controller.productList[index].name!}",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize:widthSize * 0.035,
                                        fontWeight: AppFontWeight.fontRegular,
                                      ),
                                    ),
                                    SizedBox(
                                      height:  widthSize * 0.02
                                        ,
                                    ),
                                    Text(
                                      "MOQ: ${controller.productList[index].moq!}",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize:widthSize * 0.035,
                                        fontWeight: AppFontWeight.fontRegular,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )),
          ]
      ).marginSymmetric(horizontal: 12),
      bottomNavigationBar: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total price :",
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w700,
              fontSize: Get.width * 0.05,
            ),
          ),
          Text(
            "\$${controller.totalPriceNew.value}",
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w700,
              fontSize: Get.width * 0.05,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 12, vertical: 8)),
    );
  }


}