class CategoryModel {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  int? parent;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoryModel(
      {this.sId,
        this.title,
        this.slug,
        this.description,
        this.icon,
        this.parent,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    parent = json['parent'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}