class TopSellers {
  String? pickup;
  String? sellerCity;
  int? sf;
  String? freeDelivery;
  String? deliveryFee;
  String? anyPromotion;
  String? sellerCode;
  String? businessName;
  String? businessNameAr;
  String? businessDescription;
  String? businessDescriptionAr;
  String? sellerLogoCdn;
  String? sellerBannerCdn;
  String? dynamicLink;
  String? sellerRating;
  String? preparationTime;
  String? sellerCategory;
  String? expressDelivery;
  String? expressDeliveryMessage;

  TopSellers(
      {this.pickup,
      this.sellerCity,
      this.sf,
      this.freeDelivery,
      this.deliveryFee,
      this.anyPromotion,
      this.sellerCode,
      this.businessName,
      this.businessNameAr,
      this.businessDescription,
      this.businessDescriptionAr,
      this.sellerLogoCdn,
      this.sellerBannerCdn,
      this.dynamicLink,
      this.sellerRating,
      this.preparationTime,
      this.sellerCategory,
      this.expressDelivery,
      this.expressDeliveryMessage});

  TopSellers.fromJson(Map<String, dynamic> json) {
    pickup = json['pickup'];
    sellerCity = json['seller_city'];
    sf = json['sf'];
    freeDelivery = json['free_delivery'];
    deliveryFee = json['delivery_fee'];
    anyPromotion = json['any_promotion'];
    sellerCode = json['seller_code'];
    businessName = json['business_name'];
    businessNameAr = json['business_name_ar'];
    businessDescription = json['business_description'];
    businessDescriptionAr = json['business_description_ar'];
    sellerLogoCdn = json['seller_logo_cdn'];
    sellerBannerCdn = json['seller_banner_cdn'];
    dynamicLink = json['dynamic_link'];
    sellerRating = json['seller_rating'];
    preparationTime = json['preparation_time'];
    sellerCategory = json['seller_category'];
    expressDelivery = json['express_delivery'];
    expressDeliveryMessage = json['express_delivery_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pickup'] = this.pickup;
    data['seller_city'] = this.sellerCity;
    data['sf'] = this.sf;
    data['free_delivery'] = this.freeDelivery;
    data['delivery_fee'] = this.deliveryFee;
    data['any_promotion'] = this.anyPromotion;
    data['seller_code'] = this.sellerCode;
    data['business_name'] = this.businessName;
    data['business_name_ar'] = this.businessNameAr;
    data['business_description'] = this.businessDescription;
    data['business_description_ar'] = this.businessDescriptionAr;
    data['seller_logo_cdn'] = this.sellerLogoCdn;
    data['seller_banner_cdn'] = this.sellerBannerCdn;
    data['dynamic_link'] = this.dynamicLink;
    data['seller_rating'] = this.sellerRating;
    data['preparation_time'] = this.preparationTime;
    data['seller_category'] = this.sellerCategory;
    data['express_delivery'] = this.expressDelivery;
    data['express_delivery_message'] = this.expressDeliveryMessage;
    return data;
  }
}