
import 'dart:convert';

import 'package:easycharge/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

void findAll() async {
  Client client = InterceptedClient.build(
      interceptors: [LoggingInterceptor()]
  );
  final Response response =
  await client.get(Uri.http('localhost:8080', '/api/clientes'));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Cliente> clientes = [];
  for (Map<String, dynamic> element in decodedJson) {
    Cliente(
      element['cliente']['id'],
      element['cliente']['nome'],
      element['cliente']['cpf'],
      element['cliente']['email'],
      element['cliente']['telefone'],
      element['cliente']['local'],
      element['cliente']['renda'],
      element['cliente']['status'],
    );
  }
  print('decoded json $decodedJson');
}
