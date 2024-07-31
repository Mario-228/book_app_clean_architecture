import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  // final String baseUrl = 'https://api.itbook.store/1.0';
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var result = await _dio.get(baseUrl + endPoint);
    return result.data;
  }
}
