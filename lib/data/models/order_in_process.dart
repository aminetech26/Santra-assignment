class OrderInProcess {
  int? numberOrders;
  String? orderMessage;
  String? orderMessageAr;

  OrderInProcess({this.numberOrders, this.orderMessage, this.orderMessageAr});

  OrderInProcess.fromJson(Map<String, dynamic> json) {
    numberOrders = json['number_orders'];
    orderMessage = json['order_message'];
    orderMessageAr = json['order_message_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number_orders'] = this.numberOrders;
    data['order_message'] = this.orderMessage;
    data['order_message_ar'] = this.orderMessageAr;
    return data;
  }
}