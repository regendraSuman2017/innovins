import 'package:innovins/data/model/login_response.dart';

abstract class LoginRepo{
  Future<LoginResponse?> loginAPI(String phoneNumber,String password);
}