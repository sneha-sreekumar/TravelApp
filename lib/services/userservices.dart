import 'package:dio/dio.dart';

class UserServices {
  final dio = Dio();
  final String url = 'https://10.0.2.2:3000/api';
  registerUser(String userdata) async {
    final response = await dio.post("${url}register", data: userdata);
    return response.data;
  }
}