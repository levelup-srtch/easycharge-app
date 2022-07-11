import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../state/clienteJsonState.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint('Request');
    debugPrint('url: ${data.url}');
    debugPrint('headers: ${data.headers}');
    debugPrint('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('Response');
    debugPrint('status code: ${data.statusCode}');
    debugPrint('headers: ${data.headers}');
    debugPrint('body: ${data.body}');
    return data;
  }
}

Future<List<ClienteJson>> findAll() async {
  Client client = InterceptedClient.build(
      interceptors: [LoggingInterceptor()]
  );
  final Response response =
  await client.get(Uri.http('localhost:8080', '/api/clientes')).timeout(Duration(seconds: 5));
  // ignore: prefer_interpolation_to_compose_strings
  final List<dynamic> decodedJson = jsonDecode('[' + response.body + ']')[0]['content'];
  final List<ClienteJson> clientes = [];
  for (Map<String, dynamic> clienteJson in decodedJson) {
    final ClienteJson json = ClienteJson(
      clienteJson['id'],
      clienteJson['nome'],
      clienteJson['cpf'],
      clienteJson['email'],
      clienteJson['telefone'],
      clienteJson['local'],
      clienteJson['renda'],
      clienteJson['status'],
    );
    clientes.add(json);
  }
  
  return clientes;
}
