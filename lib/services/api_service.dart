import 'dart:developer';

import 'package:bilytica_task/utils/extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  ApiService() {
    _dio.options = BaseOptions(baseUrl: baseUrl);
  }

  final String baseUrl = "https://randomuser.me/api";

  final Dio _dio = Dio();

  Future<Response?> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );

      log(response.realUri.toString());

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          debugPrint("Request succeeded with status: ${response.statusCode}");
          return response;
        } else {
          debugPrint("Request failed with status: ${response.statusCode}");
          _handleErrorStatusCode(response);
        }
      }
    } on DioException catch (e) {
      _handleErrorStatusCode(e.response!);
    } catch (e) {
      debugPrint("Unhandled GET request error: $e");
    }

    return null;
  }

  void _handleErrorStatusCode(Response response) {
    int? statusCode = response.statusCode;

    if (statusCode == null) {
      debugPrint("Unknown status code");
      return;
    }
    if (response.statusCode == 401) {
      debugPrint("401: Unauthorized - ${response.data}");
      throw UnAuthorizedAccess(response.data, '401');
    } else {
      debugPrint(
          "Unhandled status code: ${response.statusCode} - ${response.data}");
      throw UnknownException(
        response,
        response.statusCode?.toString() ?? "",
      );
    }
  }
}
