import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:innovins/data/model/login_response.dart';
import 'package:innovins/data/repository/login/login_repo.dart';
import 'package:innovins/service/http_service.dart';
import 'package:innovins/service/http_service_impl.dart';

class  LoginRepoImpl extends LoginRepo{
  late HttpService _httpService;

  LoginRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  Future<LoginResponse?> loginAPI(String phoneNumber,String password)async{
      try{
final response = await _httpService.loginRequest(phoneNumber,password);
Map<String,dynamic>responseMap = Map.from(jsonDecode(response.toString()));
return LoginResponse.fromJson(responseMap);
      }on Exception catch(e){
        if (kDebugMode) {
          print(e);
        }
        return null;
      }
  }
}