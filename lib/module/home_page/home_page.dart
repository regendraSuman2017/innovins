import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovins/core/globals.dart';
import 'package:innovins/core/icons.dart';
import 'package:innovins/core/localdatabase/product_cart_list.dart';
import 'package:innovins/core/theme/app_color.dart';
import 'package:innovins/core/theme/app_font_weight.dart';
import 'package:innovins/core/theme/app_text.dart';
import 'package:innovins/data/model/getAllProduct_response.dart';
import 'package:innovins/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthSize = Get.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKeyN,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
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
                Navigator.pop(context); // Closes the drawer
                Future.delayed(const Duration(seconds: 1));
              Get.toNamed(Routes.addProductCart);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart), // Icon for theme toggle
              title: const Text(AppText.viewProduct),
              onTap: (){
                Navigator.pop(context); // Closes the drawer
                Future.delayed(const Duration(seconds: 1));
                Get.toNamed(Routes.productList);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout), // Icon for theme toggle
              title: const Text(AppText.logout),
              onTap: ()async{

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pop(context); // Closes the drawer
                Future.delayed(const Duration(seconds: 1));
                Get.offAllNamed(Routes.loginScreen);
              },
            ),
          ],
        ),
      ).paddingOnly(top: 20),

      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vegetables",style: GoogleFonts.nunitoSans(fontSize: Get.width*0.07,fontWeight: AppFontWeight.fontBold),),
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
                    fontSize:widthSize*0.04,
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: AppIcons.searchIcon
              ),
            ).marginOnly(top: 10,bottom: 10),



            Obx(()=> SizedBox(
              height: Get.height*0.65,
              child: controller.isLoading.value==true? const Center(child: CircularProgressIndicator(),)
                  : ListView.builder(
                itemCount: controller.getProductFilterList.length,
                itemBuilder: (context, index) {
                  GetAllProductResponse product = controller.getProductFilterList[index];
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Get.toNamed(Routes.productDetailScreen, arguments: [
                        product.id,
                        product.name,
                        product.moq,
                        product.price
                    ]);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/img1.png',
                              fit: BoxFit.cover,
                            )
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                product.name!,
                                style: TextStyle(
                                  fontSize:widthSize * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: widthSize * 0.02,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: '${product.price}',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize:widthSize * 0.04,
                                      color: AppColor.black,
                                      fontWeight: AppFontWeight.fontBold
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' \$ /piece',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: widthSize*0.037,
                                            color: AppColor.darkGrey
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: widthSize * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() => OutlinedButton(
                                    onPressed: () {
                                      // Toggle isFavorite for both lists
                                      controller.getProductList[index].isFavorite = !controller.getProductList[index].isFavorite!;
                                      controller.getProductFilterList[index].isFavorite = controller.getProductList[index].isFavorite;

                                      // Refresh the filtered list
                                      controller.getProductFilterList.refresh();
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: AppColor.whiteColor,
                                      side: const BorderSide(color: AppColor.darkGrey, width: 1.5), // Border color and width
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0), // Border radius
                                      ),
                                    ),
                                    child: Icon(
                                      controller.getProductFilterList[index].isFavorite! ? Icons.favorite:Icons.favorite_border_outlined,
                                      color: controller.getProductFilterList[index].isFavorite! ? Colors.red : AppColor.darkGrey,
                                      size: Get.width * 0.06,
                                    ),
                                  )
                                  ),

                                  OutlinedButton(
                                    onPressed: () async {
                                      ProductCartListOffline product = ProductCartListOffline(
                                        productId: controller.getProductFilterList[index].id,
                                        moq: controller.getProductFilterList[index].moq,
                                        name: controller.getProductFilterList[index].name,
                                        price: controller.getProductFilterList[index].price,
                                        discountedPrice: controller.getProductFilterList[index].discountedPrice,
                                        quantity: 1,
                                      );
                                      await product.save().then((value){
                                        print("askjdkl");
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: AppColor.buttonColor, // Text color
                                      side: const BorderSide(color: Colors.blue, width: 1.5), // Border color and width
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0), // Border radius
                                      ),
                                    ),
                                    child: Icon(Icons.shopping_cart, color: AppColor.whiteColor, size: Get.width*0.06, ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 8),
                  );
                },
              ),
            )
            )
          ],
        ).paddingSymmetric(horizontal: widthSize*0.035),
      ),
    );
  }




}
