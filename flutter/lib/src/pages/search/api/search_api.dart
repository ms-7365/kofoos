import 'dart:io';

import 'package:dio/dio.dart';

class SearchApi {
  var searchDio = Dio(
    BaseOptions(
      baseUrl: "http://i10a309.p.ssafy.io:8080",
      // baseUrl: "http://10.0.2.2:8080",
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json'
      },
    ),
  );

  Future<List<String>> getRanking() async {
    try {
      var response = await searchDio.get('/products/category/ranking');
      List<String> ranking = List<String>.from(response.data);
      return ranking;
    } catch (e) {
      throw Exception('getRanking error: $e');
    }
  }

  Future<List<String>> getCat3(String cat1, String cat2) async {
    try {
      var response =
          await searchDio.get('/products/category?cat1=$cat1&cat2=$cat2');
      List<String> cat3List = List<String>.from(response.data);
      List<String> uniqueCat3List = cat3List.toSet().toList();
      return uniqueCat3List;
    } catch (e) {
      throw Exception('getRanking error: $e');
    }
  }

  Future<dynamic> getProductDetail(String itemNo) async {
    try {
      final response = await searchDio.get('/products/detail/no/$itemNo');
      return response.data;
    } on DioError catch (e) {
      throw Exception('getProductDetail error:$e');
    }
  }

  Future<dynamic> getProducts(String cat1, String cat2, String order) async {
    try {
      final response = await searchDio
          .get('/products/list?cat1=$cat1&cat2=$cat2&order=$order');
      return response.data;
    } on DioError catch (e) {
      throw Exception('getProduct error:$e');
    }
  }

  Future<dynamic> getProductByBarcode(String barcode) async {
    try {
      final response = await searchDio.get('/products/detail/$barcode/reayeon');
      return response.data;
    } on DioError catch (e) {
      throw Exception('getProductDetail error:$e');
    }
  }
}
