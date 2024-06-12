import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> getData(
      {required endPoint, required Map<String, dynamic> query}) async {
    var reponse = await dio.get('$baseUrl$endPoint', queryParameters: query);
    return reponse.data;
  }
}
