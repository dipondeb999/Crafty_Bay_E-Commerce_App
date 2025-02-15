import 'package:crafty_bay_ecommerce_project/features/common/data/models/category/category_list_data_model.dart';

class CategoryPaginationResponseModel {
  int? code;
  String? status;
  String? msg;
  CategoryListDataModel? data;

  CategoryPaginationResponseModel({this.code, this.status, this.msg, this.data});

  CategoryPaginationResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? CategoryListDataModel.fromJson(json['data']) : null;
  }
}
