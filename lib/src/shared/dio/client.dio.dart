import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ClientDio {
  Dio client = Dio();

  ClientDio() {
    client.options.baseUrl = dotenv.env['API_URL']!;
    client.options.connectTimeout = 5000;
    client.options.receiveTimeout = 3000;
  }
}