import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:innovins/data/model/sign_up_response.dart';
import 'package:innovins/data/repository/sign_repo/sign_up_repo.dart';
import 'package:innovins/service/http_service.dart';
import 'package:innovins/service/http_service_impl.dart';

class SignUpRepoImpl extends SignUpRepo{
  late HttpService _httpService;
  SignUpRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<SignUpResponse?> signUpAPI(String name,String email,String mobile,String password) async {
    try {
      final response = await _httpService.signupRequest( name, email, mobile, password);
      Map<String, dynamic> responseMap = Map.from(jsonDecode(response.toString()));
      return SignUpResponse.fromJson(responseMap);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}