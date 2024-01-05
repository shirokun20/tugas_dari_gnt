class RegisterResponseModel {
  String? token;
  int? id;

  RegisterResponseModel({this.token, this.id});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}