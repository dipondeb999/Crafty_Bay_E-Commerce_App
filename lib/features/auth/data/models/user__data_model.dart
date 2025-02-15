import 'package:crafty_bay_ecommerce_project/features/auth/data/models/profile_model.dart';

class UserDataModel {
  String? token;
  ProfileModel? user;

  UserDataModel({this.token, this.user});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? ProfileModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
