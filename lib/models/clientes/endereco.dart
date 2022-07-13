import 'package:flutter/material.dart';

class Endereco extends ChangeNotifier{

  String _rua = '';
  String _numero = '';
  String _complemento ='';
  String _bairro = '';
  String _cidade = '';
  String _estado ='';

  String get rua => _rua;

  String get numero => _numero;

  String get complemento => _complemento;

  String get bairro => _bairro;

  String get cidade => _cidade;

  String get estado => _estado;

  set estado(String value) {
    _estado = value;
    notifyListeners();
  }

  set cidade(String value) {
    _cidade = value;
    notifyListeners();
  }

  set bairro(String value) {
    _bairro = value;
    notifyListeners();
  }

  set complemento(String value) {
    _complemento = value;
    notifyListeners();
  }

  set numero(String value) {
    _numero = value;
    notifyListeners();
  }

  set rua(String value) {
    _rua = value;
    notifyListeners();
  }
}