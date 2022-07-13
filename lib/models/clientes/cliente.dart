import 'package:flutter/material.dart';

class Cliente extends ChangeNotifier{

  int _id;
  String _nome;
  String _cpf;
  String _telefone;
  String _email;
  String _profissao;
  double _renda;
  String _rua;
  String _numero;
  String? _complemento;
  String _bairro;
  String _cidade;
  String _estado;



  int get id => _id;

  String get nome => _nome;

  String get cpf => _cpf;

  String get telefone => _telefone;

  String get email => _email;

  String get profissao => _profissao;

  double get renda => _renda;


  String get estado => _estado;


  String? get complemento => _complemento;

  set id(int value) {
    _id = value;
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


  String get cidade => _cidade;

  set cidade(String value) {
    _cidade = value;
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;
  }


  String get numero => _numero;

  set numero(String value) {
    _numero = value;
  }

  String get rua => _rua;

  set rua(String value) {
    _rua = value;
  }


  set estado(String value) {
    _estado = value;
  }


  set complemento(String? value) {
    _complemento = value;
  }

  Cliente(
      this._id,
      this._nome,
      this._cpf,
      this._telefone,
      this._email,
      this._profissao,
      this._renda,
      this._rua,
      this._numero,
      this._complemento,
      this._bairro,
      this._cidade,
      this._estado


  );
  Map<String, dynamic> mapJson() {
    return {
      'nome': _nome,
      'cpf': _cpf,
      'telefone': _telefone,
      'email': _email,
      'status': 'ATIVO',
      'endereco': {
        'rua': _rua,
        'numero': _numero,
        'complemento': _complemento,
        'bairro': _bairro,
        'cidade': _cidade,
        'estado': _estado,
      },
      'profissao': _profissao,
      'renda': _renda,

    };
  }
}