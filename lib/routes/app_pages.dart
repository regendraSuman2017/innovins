
import 'package:get/get.dart';
import 'package:innovins/module/add_product/add_product_binding.dart';
import 'package:innovins/module/add_product/add_product_view.dart';
import 'package:innovins/module/dashboard/binding/dashboard_binding.dart';
import 'package:innovins/module/dashboard/view/dashboard.dart';
import 'package:innovins/module/home_page/home_page.dart';
import 'package:innovins/module/home_page/home_page_binding.dart';
import 'package:innovins/module/login_screen/login_screen_binding.dart';
import 'package:innovins/module/login_screen/login_screen_view.dart';
import 'package:innovins/module/product_cart_page/product_cart_view.dart';
import 'package:innovins/module/product_detail_page/product_detail_binding.dart';
import 'package:innovins/module/product_detail_page/product_detail_page.dart';
import 'package:innovins/module/product_list/product_list_binding.dart';
import 'package:innovins/module/product_list/product_list_view.dart';
import 'package:innovins/module/signup_screen/signup_screen_binding.dart';
import 'package:innovins/module/signup_screen/signup_screen_view.dart';
import 'package:innovins/module/splash/splash_binding.dart';
import 'package:innovins/module/splash/splash_page.dart';

import '../module/product_cart_page/product_cart_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const  String initial = Routes.splashScreen;

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: _Paths.splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
     GetPage(name: _Paths.homeScreen, page: () =>  const HomePage(), binding: HomePageBinding()),
     GetPage(name: _Paths.productDetailScreen, page: () =>  const ProductDetailPage(), binding: ProductDetailBinding()),
     GetPage(name: _Paths.signUpScreenView, page: () => const SignUpScreenView(), binding: SignUpScreenBinding()),
    GetPage(name: _Paths.loginScreen, page: () => const LoginScreenView(), binding: LoginScreenBinding()),
     GetPage(name: _Paths.dashBoardScreen, page: () =>  const Dashboard(), binding: DashboardBinding()),
     GetPage(name: _Paths.productCardList, page: () =>  const ProductCartScreen(), binding: ProductCartBinding()),
     GetPage(name: _Paths.addProductCart, page: () =>  const AddProductView(), binding: AddProductBinding()),
     GetPage(name: _Paths.productList, page: () =>   const ProductListView(), binding: ProductListBinding()),

  ];
}