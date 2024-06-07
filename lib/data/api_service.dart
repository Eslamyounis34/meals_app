import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> getData(String endPoint) async {
    var reponse = await dio.get('$baseUrl$endPoint');
    return reponse.data;
  }
}
