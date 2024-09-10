class AddProductResponse {
  String? title;
  String? message;

  AddProductResponse({this.title, this.message});

  AddProductResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    return data;
  }
}
