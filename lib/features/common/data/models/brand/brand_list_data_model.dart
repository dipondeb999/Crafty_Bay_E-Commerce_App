import 'package:crafty_bay_ecommerce_project/features/common/data/models/brand/brand_model.dart';

class BrandListDataModel {
  List<BrandModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  BrandListDataModel(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  BrandListDataModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <BrandModel>[];
      json['results'].forEach((v) {
        results!.add(BrandModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}