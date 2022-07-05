import 'package:easycharge/models/cliente.dart';
import 'package:flutter/material.dart';

class ListaDeClientes extends ChangeNotifier {
  List<Cliente> _clientes = [];

  List<Cliente> getClientes() => _clientes;

  void adicionaCliente(Cliente novoCliente) {
    _clientes.add(novoCliente);
    notifyListeners();
  }

}