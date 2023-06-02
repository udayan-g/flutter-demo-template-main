import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'ph_data.dart';
import 'package:dio/dio.dart';

class DataService {
  final dio = Dio();

  String apiUrl = 'http://api-1f3m6.strapidemo.com/api/phdatas';
  Future<Response> getPhData() async {
    final response = await dio.get(apiUrl);
    if (response.statusCode == 200) {
      //final List<dynamic> jsonList = json.decode(response.body);

      return response;
    } else {
      throw Exception('Failed to load pH data');
    }
  }
}
