import 'dart:convert';

import 'package:easycharge/models/clientes/cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint(data.body);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

Future<List<Cliente>> buscartodos() async {
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client
      .get(Uri.http('localhost:8080', '/api/clientes'))
      .timeout(Duration(seconds: 5));
  // ignore: prefer_interpolation_to_compose_strings
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Cliente> clientes = [];
  for (Map<String, dynamic> cliente in decodedJson) {
    final Cliente json = Cliente(
      cliente['id'],
      cliente['nome'],
      cliente['cpf'],
      cliente['telefone'],
      cliente['email'],
      cliente['profissao'],
      cliente['renda'],
      cliente['status'],
      cliente['rua'],
      cliente['numero'],
      cliente['complemento'],
      cliente['bairro'],
      cliente['cidade'],
      cliente['estado'],
    );
    clientes.add(json);
  }

  return clientes;
}

Future<Cliente> cadastroCliente(Cliente cliente) async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String clienteJson = jsonEncode(cliente.mapJson());

  final Response response = await client.post(
      Uri.http('10.0.3.252:8080', '/api/clientes'),
      headers: {'Content-type': 'application/json'},
      body: clienteJson);

  Map<String, dynamic> json = jsonDecode(response.body);

  debugPrint(response.body);
  return Cliente(
    json['id'],
    json['nome'],
    json['cpf'],
    json['telefone'],
    json['email'],
    json['profissao'],
    json['renda'],
    json['status'],
    json['rua'],
    json['numero'],
    json['complemento'],
    json['bairro'],
    json['cidade'],
    json['estado'],
  );
}
