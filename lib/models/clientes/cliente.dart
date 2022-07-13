import 'package:flutter/material.dart';

class Cliente extends ChangeNotifier{

  double _id;
  String _nome;
  String _cpf;
  String _telefone;
  String _email;
  String _profissao;
  double _renda;
  String _status;
  String _rua;
  String _numero;
  String _complemento ;
  String _bairro;
  String _cidade;
  String _estado;


  double get id => _id;

  String get nome => _nome;

  String get cpf => _cpf;

  String get telefone => _telefone;

  String get email => _email;

  String get profissao => _profissao;

  double get renda => _renda;

  String get status => _status;


  set id(double value) {
    _id = value;
  }

  set status(String value) {
    _status = value;
    notifyListeners();
  }

  set renda(double value) {
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
      this._id,
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
  Map<String, dynamic> mapJson() {
    return {
      'nome': _nome,
      'cpf': _cpf,
      'telefone': _telefone,
      'email': _email,
      'rua': _rua,
      'numero': _numero,
      'bairro': _bairro,
      'cidade': _cidade,
      'estado': _estado,
      'profissao': _profissao,
      'renda': _renda,
      'complemento': _complemento
    };
  }
}