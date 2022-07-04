import 'package:flutter/material.dart';

class Funcionario extends ChangeNotifier{

  int _id;
  String _nome;
  String _email;
  String _cpf;
  String _celular;
  String _cargo;
  String _status;


  int get id => _id;

  String get nome => _nome;

  String get email => _email;

  String get cpf => _cpf;

  String get celular => _celular;

  String get cargo => _cargo;

  String get status => _status;


  set id(int value) {
    _id = value;
    notifyListeners();
  }

  set status(String value) {
    _status = value;

    notifyListeners();
  }

  set cargo(String value) {
    _cargo = value;
    notifyListeners();
  }

  set celular(String value) {
    _celular = value;
    notifyListeners();
  }

  set cpf(String value) {
    _cpf = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set nome(String value) {
    _nome = value;
    notifyListeners();
  }
}