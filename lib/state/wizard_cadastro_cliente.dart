import 'package:easycharge/models/cliente.dart';
import 'package:flutter/material.dart';

class WizardCadastroDeClienteState extends ChangeNotifier {

  String _nome = '';
  String _cpf = '';
  String _email = '';
  String _telefone = '';
  String _cargo = '';
  String _rua = '';
  String _bairro = '';
  String _numero = '';

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

  set passoAtual(int value) {
    _passoAtual = value;
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

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get telefone => _telefone;

  set telefone(String value) {
    _telefone = value;
  }

  String get cargo => _cargo;

  set cargo(String value) {
    _cargo = value;
  }

  String get rua => _rua;

  set rua(String value) {
    _rua = value;
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;
  }

  String get numero => _numero;

  set numero(String value) {
    _numero = value;
  }

  Cliente criaCliente() {
    Cliente cliente = Cliente(_nome, _cpf, _email, _telefone, _cargo, _rua, _bairro, _numero);
    _nome = '';
    _cpf = '';
    _email = '';
    _telefone = '';
    _cargo = '';
    _rua = '';
    _bairro = '';
    _numero = '';

    return cliente;
  }
}
