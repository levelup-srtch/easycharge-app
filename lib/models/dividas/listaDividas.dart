import 'package:easycharge/models/dividas/dividas.dart';
import 'package:flutter/material.dart';

class ListaDeDividas extends ChangeNotifier {
  List<Divida> _dividas = [];

  List<Divida> getDividas() => _dividas;

  void adicionaDivida(Divida novaDivida) {
    _dividas.add(novaDivida);
    notifyListeners();
  }

}