import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/cliente.dart';
import '../models/clienteJson.dart';

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

final Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()]
);

Future<List<ClienteJson>> findAll() async {
  final Response response =
  await client.get(Uri.http('localhost:8080', '/api/clientes')).timeout(Duration(seconds: 5));
  // await client.get(Uri.parse('http://10.0.2.2:8080/api/clientes'));
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

Future<ClienteJson> cadastroCliente(Cliente cliente) async {

  final String clienteJson = jsonEncode(cliente.mapJson());

  final Response response = await client.post(
      Uri.http('localhost:8080', '/api/clientes'),
      headers: {'Content-type': 'application/json'},
      body: clienteJson);

  Map<String, dynamic> json = jsonDecode(response.body);

  debugPrint(response.body);
  return ClienteJson(json['id'], json['nome'], json['cpf'], json['email'], json['telefone'],
      json['local'], json['renda'], json['status']);
}

Future<ClienteJson> deleteCliente(int id) async{
  final Response response = await client.delete(
      Uri.http('localhost:8080', '/api/clientes'),
      headers: {'Content-type': 'application/json'});

  debugPrint(response.body);

  if (response.statusCode == 200) {
    return (json.decode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}
