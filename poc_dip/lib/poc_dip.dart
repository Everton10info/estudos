import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  consume(DioClientHttp());
}

void consume(ServiceHttpClient service) async {
  final data = await service.getData();
  print(data);
}

abstract class ServiceHttpClient {
  Future<Map> getData();
}

class DioClientHttp implements ServiceHttpClient {
  @override
  Future<Map> getData() async {
    var dio = Dio();
    final reponse =
        await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    print('Result http: ${reponse.data}');
    return reponse.data;
  }
}

class HttpClientHttp implements ServiceHttpClient {
  @override
  Future<Map> getData() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
    );

    final jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }
}
