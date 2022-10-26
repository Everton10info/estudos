import 'package:dio/dio.dart';

void main(List<String> args) {
  HttpService().getItems();
}

class HttpService {
  Future<List> getItems() async {
    final response = await Dio().get('http://localhost:3000/items');
    print('${response.data}');
    return response.data;
  }
}
