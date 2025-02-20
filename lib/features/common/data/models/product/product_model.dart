import 'package:crafty_bay_ecommerce_project/features/common/data/models/brand/brand_model.dart';

class ProductModel {
  String? sId;
  String? title;
  List<BrandModel>? categories;
  String? slug;
  String? metaDescription;
  String? description;
  List<String>? photos;
  List<String>? colors;
  List<String>? sizes;
  List<String>? tags;
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  bool? inCart;
  bool? inWishlist;
  BrandModel? brand;

  ProductModel({
    this.sId,
    this.title,
    this.categories,
    this.slug,
    this.metaDescription,
    this.description,
    this.photos,
    this.colors,
    this.sizes,
    this.tags,
    this.regularPrice,
    this.currentPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.inCart,
    this.inWishlist,
    this.brand,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];

    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(BrandModel.fromJson(v));
      });
    }

    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];

    if (json['photos'] != null) {
      photos = List<String>.from(json['photos']);
    }

    colors = json['colors']?.cast<String>();
    sizes = json['sizes']?.cast<String>();

    if (json['tags'] != null) {
      tags = List<String>.from(json['tags']);
    }

    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    inCart = json['in_cart'];
    inWishlist = json['in_wishlist'];

    brand = json['brand'] != null ? BrandModel.fromJson(json['brand']) : null;
  }
}
