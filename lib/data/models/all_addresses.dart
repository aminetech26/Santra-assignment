class AllAddresses {
  String? id;
  String? userBuilding;
  String? flatVilla;
  String? userAddressLine;
  String? addressType;
  String? userArea;
  String? userCity;
  String? userName;
  String? userPhone;
  int? selectedAddress;

  AllAddresses(
      {this.id,
      this.userBuilding,
      this.flatVilla,
      this.userAddressLine,
      this.addressType,
      this.userArea,
      this.userCity,
      this.userName,
      this.userPhone,
      this.selectedAddress});

  AllAddresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userBuilding = json['user_building'];
    flatVilla = json['flat_villa'];
    userAddressLine = json['user_address_line'];
    addressType = json['address_type'];
    userArea = json['user_area'];
    userCity = json['user_city'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    selectedAddress = json['selected_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_building'] = this.userBuilding;
    data['flat_villa'] = this.flatVilla;
    data['user_address_line'] = this.userAddressLine;
    data['address_type'] = this.addressType;
    data['user_area'] = this.userArea;
    data['user_city'] = this.userCity;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['selected_address'] = this.selectedAddress;
    return data;
  }
}