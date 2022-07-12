import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class Cliente extends ChangeNotifier {
  String _nome;
  String _cpf;
  String _telefone;
  String _email;
  String _rua;
  String _numero;
  String _complemento = '';
  String _bairro;
  String _cidade;
  String _estado;
  String _profissao;
  String _renda;
  late String _status;

  Cliente(
    this._nome,
    this._cpf,
    this._telefone,
    this._email,
    this._rua,
    this._numero,
    this._bairro,
    this._cidade,
    this._estado,
    this._profissao,
    this._renda,
  );

  String get status => _status;

  set status(String value) {
    _status = value;

    notifyListeners();
  }

  String get renda => _renda;

  set renda(String value) {
    _renda = value;

    notifyListeners();
  }

  String get profissao => _profissao;

  set profissao(String value) {
    _profissao = value;

    notifyListeners();
  }

  String get estado => _estado;

  set estado(String value) {
    _estado = value;

    notifyListeners();
  }

  String get cidade => _cidade;

  set cidade(String value) {
    _cidade = value;

    notifyListeners();
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;

    notifyListeners();
  }

  String get complemento => _complemento;

  set complemento(String value) {
    _complemento = value;

    notifyListeners();
  }

  String get numero => _numero;

  set numero(String value) {
    _numero = value;

    notifyListeners();
  }

  String get rua => _rua;

  set rua(String value) {
    _rua = value;

    notifyListeners();
  }

  String get email => _email;

  set email(String value) {
    _email = value;

    notifyListeners();
  }

  String get telefone => _telefone;

  set telefone(String value) {
    _telefone = value;

    notifyListeners();
  }

  String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;

    notifyListeners();
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;

    notifyListeners();
  }

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
      'renda': UtilBrasilFields.converterMoedaParaDouble(_renda),
      'complemento': _complemento
    };
  }
}
