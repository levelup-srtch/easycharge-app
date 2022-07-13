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
  final List<Cliente> clientes = [];
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client
      .get(Uri.http('172.19.144.1:8080', '/api/clientes'))
      .timeout(Duration(seconds: 5));
  final List<dynamic> decodedJson = jsonDecode(response.body);

  for (Map<String, dynamic> cliente in decodedJson) {
    final Cliente json = Cliente(
      cliente['id'],
      cliente['nome'],
      cliente['cpf'],
      cliente['telefone'],
      cliente['email'],
      cliente['profissao'],
      cliente['renda'],
      cliente['endereco']['rua'],
      cliente['endereco']['numero'],
      cliente['endereco']['complemento'],
      cliente['endereco']['bairro'],
      cliente['endereco']['cidade'],
      cliente['endereco']['estado'],
    );
    clientes.add(json);
  }

  return clientes;
}

void cadastroCliente(Cliente cliente) async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String clienteJson = jsonEncode(cliente.mapJson());

  final Response response = await client.post(
    Uri.http('172.19.144.1:8080', '/api/clientes'),
    headers: {'Content-type': 'application/json'},
    body: clienteJson,
  );

  Map<String, dynamic> json = jsonDecode(response.body);


}
