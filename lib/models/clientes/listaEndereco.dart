import 'package:flutter/material.dart';
import 'endereco.dart';

class ListaEndereco extends ChangeNotifier{
  List<Endereco> _endereco = [];

  List<Endereco> getEndereco() => _endereco;

  void adicionarEndereco(Endereco novoEndereco){
    _endereco.add(novoEndereco);
    notifyListeners();
  }
}