import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:innovins/data/model/getAllProduct_response.dart';
import 'package:innovins/data/repository/home/home_repo.dart';
import 'package:innovins/service/http_service.dart';
import 'package:innovins/service/http_service_impl.dart';

class HomeRepoImpl implements HomeRepo {

late  HttpService _httpService;
  HomeRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

@override
  Future<List<GetAllProductResponse>?> getAllProductsAPI() async {
  try {
    final response = await _httpService.getAllProductsRequest();
    return getAllProductResponseFromJson(jsonEncode(response.data));
  } on Exception catch (e) {
    debugPrint(e.toString());
    return null;
  }
}
List<GetAllProductResponse> getAllProductResponseFromJson(String str) => List<GetAllProductResponse>.from(json.decode(str).map((x) => GetAllProductResponse.fromJson(x)));



}