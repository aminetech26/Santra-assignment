class OrderToBeReviewed {
  int? orderNumber;
  String? sellerCode;
  String? sellerName;
  String? sellerNameAr;

  OrderToBeReviewed(
      {this.orderNumber, this.sellerCode, this.sellerName, this.sellerNameAr});

  OrderToBeReviewed.fromJson(Map<String, dynamic> json) {
    orderNumber = json['order_number'];
    sellerCode = json['seller_code'];
    sellerName = json['seller_name'];
    sellerNameAr = json['seller_name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_number'] = this.orderNumber;
    data['seller_code'] = this.sellerCode;
    data['seller_name'] = this.sellerName;
    data['seller_name_ar'] = this.sellerNameAr;
    return data;
  }
}