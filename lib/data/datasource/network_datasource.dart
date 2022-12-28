import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:workit/domain/model/company.dart';
import 'package:workit/domain/model/job.dart';

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
        String? name = jsonItems[i]["name"];
        String? description = jsonItems[i]["description"];
        String? industry = jsonItems[i]["industry"];
        int id = jsonItems[i]["id"];
        result.add(Company(id, name??'', description??'', industry??''));
      }
      return Future.value(result);
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  Future<List<Job>> getAllJobsOfCompany(String companyID) async {
    try {
      Response<String> response = await Dio()
          .get('http://3.75.134.87/flutter/v1/companies/$companyID/jobs/');
      print(response);
      List<Job> result = await parseJobs(response);
      return Future.value(result);
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  Future<List<Job>> getAllJobs() async {
    try {
      Response<String> response =
          await Dio().get('http://3.75.134.87/flutter/v1/jobs');
      print(response);
      List<Job> result = await parseJobs(response);
      return Future.value(result);
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  Future<List<Job>> parseJobs(Response<String> response) async {
    List<Job> result = [];
    final data = await json.decode(response.data!);
    List jsonItems = data["result"];
    for (var i = 0; i < jsonItems.length; i++) {
      String? title = jsonItems[i]["title"];
      String? description = jsonItems[i]["description"];
      String? city = jsonItems[i]["city"];
      int id = jsonItems[i]["id"];
      int companyId = jsonItems[i]["companyId"];
      result.add(Job(id, companyId, title??'', description??'', city??''));
    }
    return result;
  }

  Future<void> createJob(
      String title, String description, String city, int companyId) async {
    try {
      var map = {
        'title': title,
        'description': description,
        'city': city,
        'companyId': companyId
      };
      Response<String> response =
          await Dio().post('http://3.75.134.87/flutter/v1/jobs', data: map);
      print(response);
      return Future.value();
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  Future<void> createCompany(
      String name, String description, String industry) async {
    try {
      var map = {
        'name': name,
        'description': description,
        'industry': industry
      };
      Response<String> response = await Dio()
          .post('http://3.75.134.87/flutter/v1/companies', data: map);
      print(response);
      return Future.value();
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  Future<void> deleteCompany(int companyId) async {
    try {
      Response<String> response = await Dio()
          .post('http://3.75.134.87/flutter/v1/companies/$companyId');
      print(response);
      return Future.value();
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  Future<void> deleteJob(int jobId) async {
    try {
      Response<String> response =
          await Dio().post('http://3.75.134.87/flutter/v1/jobs/$jobId');
      print(response);
      return Future.value();
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
}
