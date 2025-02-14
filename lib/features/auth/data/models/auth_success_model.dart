import 'package:crafty_bay_ecommerce_project/features/auth/data/models/user_data_model.dart';

class AuthSuccessModel {
  int? code;
  String? status;
  String? msg;
  UserDataModel? data;

  AuthSuccessModel({this.code, this.status, this.msg, this.data});

  AuthSuccessModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? UserDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
