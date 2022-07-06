import 'package:easycharge/models/clienteList.dart';
import 'package:flutter/material.dart';

class Cliente extends ChangeNotifier {
  late String _nome;
  late String _cpf;
  late String _telefone;
  late String _email;
  late String _rua;
  late String _numero;
  late String _complemento;
  late String _bairro;
  late String _cidade;
  late String _estado;
  late String _profissao;
  late String _renda;
  late String _status;


  Cliente(
    this._nome,
    this._cpf,
    this._telefone,
    this._email,
    this._rua,
    this._numero,
    this._complemento,
    this._bairro,
    this._cidade,
    this._estado,
    this._profissao,
    this._renda,
    this._status,
  );


  ClienteList map() {
    return ClienteList(_nome, _cpf, _status);
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get renda => _renda;

  set renda(String value) {
    _renda = value;
  }

  String get profissao => _profissao;

  set profissao(String value) {
    _profissao = value;
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

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get telefone => _telefone;

  set telefone(String value) {
    _telefone = value;
  }

  String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}
