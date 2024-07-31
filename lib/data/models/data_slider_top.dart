import 'package:santra_assignment/data/models/categories.dart';
import 'package:santra_assignment/data/models/home_slider.dart';
import 'package:santra_assignment/data/models/order_in_process.dart';
import 'package:santra_assignment/data/models/order_to_be_reviewed.dart';
import 'package:santra_assignment/data/models/top_sellers.dart';

class DataSliderTop {
  List<Categories>? categories;
  List<OrderInProcess>? orderInProcess;
  List<HomeSlider>? homeSlider;
  String? homeSliderShow;
  List<TopSellers>? topSellers;
  String? getOrderReview;
  List<OrderToBeReviewed>? orderToBeReviewed;
  String? showFirstTime;
  String? firstTimeCode;

  DataSliderTop(
      {this.categories,
      this.orderInProcess,
      this.homeSlider,
      this.homeSliderShow,
      this.topSellers,
      this.getOrderReview,
      this.orderToBeReviewed,
      this.showFirstTime,
      this.firstTimeCode});

  DataSliderTop.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['order_in_process'] != null) {
      orderInProcess = <OrderInProcess>[];
      json['order_in_process'].forEach((v) {
        orderInProcess!.add(new OrderInProcess.fromJson(v));
      });
    }
    if (json['home_slider'] != null) {
      homeSlider = <HomeSlider>[];
      json['home_slider'].forEach((v) {
        homeSlider!.add(new HomeSlider.fromJson(v));
      });
    }
    homeSliderShow = json['home_slider_show'];
    if (json['top_sellers'] != null) {
      topSellers = <TopSellers>[];
      json['top_sellers'].forEach((v) {
        topSellers!.add(new TopSellers.fromJson(v));
      });
    }
    getOrderReview = json['get_order_review'];
    if (json['order_to_be_reviewed'] != null) {
      orderToBeReviewed = <OrderToBeReviewed>[];
      json['order_to_be_reviewed'].forEach((v) {
        orderToBeReviewed!.add(new OrderToBeReviewed.fromJson(v));
      });
    }
    showFirstTime = json['show_first_time'];
    firstTimeCode = json['first_time_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.orderInProcess != null) {
      data['order_in_process'] =
          this.orderInProcess!.map((v) => v.toJson()).toList();
    }
    if (this.homeSlider != null) {
      data['home_slider'] = this.homeSlider!.map((v) => v.toJson()).toList();
    }
    data['home_slider_show'] = this.homeSliderShow;
    if (this.topSellers != null) {
      data['top_sellers'] = this.topSellers!.map((v) => v.toJson()).toList();
    }
    data['get_order_review'] = this.getOrderReview;
    if (this.orderToBeReviewed != null) {
      data['order_to_be_reviewed'] =
          this.orderToBeReviewed!.map((v) => v.toJson()).toList();
    }
    data['show_first_time'] = this.showFirstTime;
    data['first_time_code'] = this.firstTimeCode;
    return data;
  }
}