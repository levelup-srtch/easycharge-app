import 'package:flutter/material.dart';

import 'endereco.dart';

class Cliente extends ChangeNotifier{

  int _id;
  String _nome;
  String _cpf;
  String _telefone;
  String _email;
  String _profissao;
  String _renda;
  String _status;
  Endereco _endereco;

  int get id => _id;

  String get nome => _nome;

  String get cpf => _cpf;

  String get telefone => _telefone;

  String get email => _email;

  String get profissao => _profissao;

  String get renda => _renda;

  String get status => _status;

  Endereco get endereco => _endereco;

  set endereco(Endereco value) {
    _endereco = value;
    notifyListeners();
  }

  set status(String value) {
    _status = value;
    notifyListeners();
  }

  set renda(String value) {
    _renda = value;
    notifyListeners();
  }

  set profissao(String value) {
    _profissao = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set telefone(String value) {
    _telefone = value;
    notifyListeners();
  }

  set cpf(String value) {
    _cpf = value;
    notifyListeners();
  }

  set nome(String value) {
    _nome = value;
    notifyListeners();
  }

  set id(int value) {
    _id = value;
    notifyListeners();
  }

  // tela de cadastro

  int _stepAtual = 0;

  int get stepAtual => _stepAtual;

  set stepAtual(int value) {
    _stepAtual = value;

    notifyListeners();
  }
}