import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:santra_assignment/data/models/results_model.dart';

abstract class LocalDataSource {
  Future<JsonResults> getData();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<JsonResults> getData() async {
    final jsonData = await rootBundle.loadString('assets/json/data.json');
    try {
      final Map<String, dynamic> jsonMap = json.decode(jsonData);
      JsonResults data = JsonResults.fromJson(jsonMap);
      return data;
    } on Exception {
      throw Exception('Failed to load data');
    }
  }
}
