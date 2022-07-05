import 'package:easycharge/models/cliente.dart';
import 'package:flutter/material.dart';

class WizardCadastroDeClienteState extends ChangeNotifier {

  String _cpf = '';
  String _nome = '';

  int _passoAtual = 0;
  int _quantidadeDeEtapas = 2;

  int get passoAtual => _passoAtual;

  void avanca() {
    _passoAtual += 1;
    notifyListeners();
  }

  void volta() {
    if (_passoAtual > 0) {
      _passoAtual -= 1;
      notifyListeners();
    }
  }

  int get quantidadeDeEtapas => _quantidadeDeEtapas;

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;
  }

  Cliente criaCliente() {
    Cliente cliente = Cliente(_cpf, _nome);
    _cpf = '';
    _nome = '';

    return cliente;
  }
}