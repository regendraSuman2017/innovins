import 'package:get/get.dart';
import 'package:innovins/module/product_list/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/icons.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/core/theme/app_text.dart';

class ProductListView extends GetView<ProductListController>{
  @override
  Widget build(BuildContext context) {
    double widthSize = Get.width;
    return Scaffold(
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[

              ListTile(
                leading: const Icon(Icons.clear),
                onTap: () {
                  // Navigate to home screen or perform action
                  Navigator.pop(context); // Closes the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet_rounded), // Icon for theme toggle
                title: const Text(AppText.addProduct),
                onTap: (){

                },
              ),
              const ListTile(
                leading: Icon(Icons.shopping_cart), // Icon for theme toggle
                title: Text(AppText.viewProduct),
              ),
            ],
          ),
        ).paddingOnly(top: 20),

        body:Column(
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
                        fontSize: widthSize*0.04
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: AppIcons.searchIcon
                ),
              ).marginOnly(top: 10,bottom: 10),

              Obx(() => SizedBox(
                height: Get.height*0.65,
                child: controller.isLoading.value==true? Center(child: CircularProgressIndicator()) :controller.getProductList.isEmpty
                    ? const Center(child: Text("Empty"))
                    : ListView.builder(
                    itemCount: controller.getProductList.length,
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(

                                      onPressed: (){
                                        controller.editProduct(
                                          controller.getProductList[index].id,
                                          controller.getProductList[index].name,
                                          controller.getProductList[index].price,
                                          controller.getProductList[index].moq,
                                          controller.getProductList[index].discountedPrice,

                                        );
                                      }, icon: const Icon(Icons.edit),

                                    ),
                                    IconButton(
                                      icon:const Icon(Icons.delete),
                                      onPressed: (){
                                        controller.deleteProduct(controller.getProductList[index].id);

                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Product Name: ${controller.getProductList[index].name!}",
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize:widthSize * 0.035,
                                              fontWeight: AppFontWeight.fontRegular,
                                            ),
                                          ),
                                          SizedBox(
                                              height: widthSize * 0.02
                                          ),
                                          Text(
                                            "MOQ: ${controller.getProductList[index].moq!}",
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
                                            "${AppText.price} ${controller.getProductList[index].price!}",
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize:widthSize * 0.035,
                                              fontWeight: AppFontWeight.fontRegular,
                                            ),
                                          ),
                                          SizedBox(
                                              height: widthSize * 0.02
                                          ),
                                          Text(
                                            "Discount: ${controller.getProductList[index].discountedPrice!}",
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
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )),
            ]
        ).marginSymmetric(horizontal: 12)
    );
  }
}