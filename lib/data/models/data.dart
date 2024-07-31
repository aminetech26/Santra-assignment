import 'package:santra_assignment/data/models/all_addresses.dart';
import 'package:santra_assignment/data/models/all_sellers.dart';
import 'package:santra_assignment/data/models/data_slider_top.dart';

class Data {
  String? userArea;
  List<DataSliderTop>? dataSliderTop;
  List<AllSellers>? allSellers;
  List<AllAddresses>? allAddresses;

  Data({this.userArea, this.dataSliderTop, this.allSellers, this.allAddresses});

  Data.fromJson(Map<String, dynamic> json) {
    userArea = json['user_area'];
    if (json['data_slider_top'] != null) {
      dataSliderTop = <DataSliderTop>[];
      json['data_slider_top'].forEach((v) {
        dataSliderTop!.add(new DataSliderTop.fromJson(v));
      });
    }
    if (json['all_sellers'] != null) {
      allSellers = <AllSellers>[];
      json['all_sellers'].forEach((v) {
        allSellers!.add(new AllSellers.fromJson(v));
      });
    }
    if (json['all_addresses'] != null) {
      allAddresses = <AllAddresses>[];
      json['all_addresses'].forEach((v) {
        allAddresses!.add(new AllAddresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_area'] = this.userArea;
    if (this.dataSliderTop != null) {
      data['data_slider_top'] =
          this.dataSliderTop!.map((v) => v.toJson()).toList();
    }
    if (this.allSellers != null) {
      data['all_sellers'] = this.allSellers!.map((v) => v.toJson()).toList();
    }
    if (this.allAddresses != null) {
      data['all_addresses'] =
          this.allAddresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}