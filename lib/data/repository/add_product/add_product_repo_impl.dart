import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:innovins/data/model/add_product.dart';
import 'package:innovins/data/repository/add_product/add_product_repo.dart';
import 'package:innovins/service/http_service.dart';
import 'package:innovins/service/http_service_impl.dart';

class AddProductRepoImpl extends AddProductRepo{
  late HttpService _httpService;
  AddProductRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }


  @override
  Future<AddProductResponse?> addProductAPI(String? productName, String? moq, String? price, String? discount) async {
    try {
      final response = await _httpService.addProductRequest(productName,moq,price,discount);
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.toString()));
      return AddProductResponse.fromJson(responseMap);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Future<AddProductResponse?> deleteProductAPI(id) async {
    try {
      final response = await _httpService.deleteProductRequest(id);
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.toString()));
      return AddProductResponse.fromJson(responseMap);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Future<AddProductResponse?> editProductAPI(id,name,price,moq,discount)async {
    try {
      final response = await _httpService.editProductRequest(id,name,price,moq,discount);
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.toString()));
      return AddProductResponse.fromJson(responseMap);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }



}