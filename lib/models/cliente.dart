import 'package:flutter/material.dart';

class Cliente extends ChangeNotifier{

  String _nome;
  String _email;
  String _cpf;
  String _celular;
  String _cargo;
  String _status;

  String get nome => _nome;

  String get email => _email;

  String get cpf => _cpf;

  String get celular => _celular;

  String get cargo => _cargo;

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  set cargo(String value) {
    _cargo = value;
  }

  set celular(String value) {
    _celular = value;
  }

  set cpf(String value) {
    _cpf = value;
  }

  set email(String value) {
    _email = value;
  }

  set nome(String value) {
    _nome = value;
  }
}