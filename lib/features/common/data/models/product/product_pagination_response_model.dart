import 'package:crafty_bay_ecommerce_project/features/common/data/models/product/product_list_data_model.dart';

class ProductPaginationResponseModel {
  int? code;
  String? status;
  String? msg;
  ProductListDataModel? data;

  ProductPaginationResponseModel({this.code, this.status, this.msg, this.data});

  ProductPaginationResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? ProductListDataModel.fromJson(json['data']) : null;
  }
}

