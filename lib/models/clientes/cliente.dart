import 'package:flutter/material.dart';

import 'endereco.dart';

class Cliente extends ChangeNotifier{


  String _nome;
  String _cpf;
  String _telefone;
  String _email;
  String _profissao;
  String _renda;
  String _status;
  String _rua;
  String _numero;
  String _complemento;
  String _bairro;
  String _cidade;
  String _estado;


  String get nome => _nome;

  String get cpf => _cpf;

  String get telefone => _telefone;

  String get email => _email;

  String get profissao => _profissao;

  String get renda => _renda;

  String get status => _status;

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

  String get estado => _estado;

  set estado(String value) {
    _estado = value;
  }

  String get cidade => _cidade;

  set cidade(String value) {
    _cidade = value;
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;
  }

  String get complemento => _complemento;

  set complemento(String value) {
    _complemento = value;
  }

  String get numero => _numero;

  set numero(String value) {
    _numero = value;
  }

  String get rua => _rua;

  set rua(String value) {
    _rua = value;
  }

  Cliente(
      this._nome,
      this._cpf,
      this._telefone,
      this._email,
      this._profissao,
      this._renda,
      this._status,
      this._rua,
      this._numero,
      this._complemento,
      this._bairro,
      this._cidade,
      this._estado,

      );
}