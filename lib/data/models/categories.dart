class Categories {
  String? categoryId;
  String? subDivisionName;
  String? subDivisionNameAr;
  String? imageThumb;

  Categories(
      {this.categoryId,
      this.subDivisionName,
      this.subDivisionNameAr,
      this.imageThumb});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    subDivisionName = json['sub_division_name'];
    subDivisionNameAr = json['sub_division_name_ar'];
    imageThumb = json['image_thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['sub_division_name'] = this.subDivisionName;
    data['sub_division_name_ar'] = this.subDivisionNameAr;
    data['image_thumb'] = this.imageThumb;
    return data;
  }
}