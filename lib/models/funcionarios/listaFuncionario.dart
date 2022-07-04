import 'package:flutter/material.dart';
import 'funcionario.dart';

class ListaDeFuncionarios extends ChangeNotifier {
  List<Funcionario> _funcionarios = [];

  List<Funcionario> getClientes() => _funcionarios;

  void adicionaFuncionario(Funcionario novoCliente) {
    _funcionarios.add(novoCliente);
    notifyListeners();
  }

}