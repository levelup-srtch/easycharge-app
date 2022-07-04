import 'package:flutter/cupertino.dart';

import 'cliente.dart';

class ListaDeClientes extends ChangeNotifier{
  List<Cliente> _clientes =[];

  List<Cliente> getClientes() => _clientes;

  void adicionaCliente(Cliente novoCliente){
    _clientes.add(novoCliente);
    notifyListeners();
  }
}