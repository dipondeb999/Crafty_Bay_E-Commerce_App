import 'package:crafty_bay_ecommerce_project/features/common/data/models/category/category_model.dart';

class CategoryListDataModel {
  List<CategoryModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  CategoryListDataModel(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  CategoryListDataModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CategoryModel>[];
      json['results'].forEach((v) {
        results!.add(CategoryModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}