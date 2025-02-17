class BrandModel {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BrandModel(
      {this.sId,
        this.title,
        this.slug,
        this.description,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.iV});

  BrandModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}