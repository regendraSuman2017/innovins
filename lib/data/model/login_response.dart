class LoginResponse {
  String? title;
  String? message;
  Data? data;

  LoginResponse({this.title, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userToken;
  String? id;
  String? name;
  String? mobile;
  String? email;

  Data({this.userToken, this.id, this.name, this.mobile, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    userToken = json['user_token'];
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_token'] = this.userToken;
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}
