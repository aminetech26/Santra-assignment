class HomeSlider {
  String? imageName;
  String? imagePath;
  String? promotionName;
  String? promotionMessage;
  String? promotionMessageAr;

  HomeSlider(
      {this.imageName,
      this.imagePath,
      this.promotionName,
      this.promotionMessage,
      this.promotionMessageAr});

  HomeSlider.fromJson(Map<String, dynamic> json) {
    imageName = json['image_name'];
    imagePath = json['image_path'];
    promotionName = json['promotion_name'];
    promotionMessage = json['promotion_message'];
    promotionMessageAr = json['promotion_message_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_name'] = this.imageName;
    data['image_path'] = this.imagePath;
    data['promotion_name'] = this.promotionName;
    data['promotion_message'] = this.promotionMessage;
    data['promotion_message_ar'] = this.promotionMessageAr;
    return data;
  }
}