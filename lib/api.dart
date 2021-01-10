import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: 'http://192.168.0.111:3333',
);

Dio api = new Dio(options);
