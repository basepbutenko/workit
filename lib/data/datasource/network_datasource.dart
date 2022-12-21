import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:workit/domain/model/company.dart';

class NetworkDataSource {
  Future<List<Company>> getAllCompanies() async {
    try {
      Response<String> response =
          await Dio().get('http://3.75.134.87/flutter/v1/companies');
      print(response);
      List<Company> result = [];
      final data = await json.decode(response.data!);
      List jsonItems = data["result"];
      for (var i = 0; i < jsonItems.length; i++) {
        String name = jsonItems[i]["name"];
        String description = jsonItems[i]["description"];
        String industry = jsonItems[i]["industry"];
        int id = jsonItems[i]["id"];
        result.add(Company(id, name, description, industry));
      }
      return Future.value(result);
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }
}
