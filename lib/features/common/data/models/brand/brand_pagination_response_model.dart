import 'package:crafty_bay_ecommerce_project/features/common/data/models/brand/brand_list_data_model.dart';

class BrandPaginationResponseModel {
  int? code;
  String? status;
  String? msg;
  BrandListDataModel? data;

  BrandPaginationResponseModel({this.code, this.status, this.msg, this.data});

  BrandPaginationResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? BrandListDataModel.fromJson(json['data']) : null;
  }
}
