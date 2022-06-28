import 'package:easycharge/models/divida.dart';
import 'package:flutter/cupertino.dart';

class ListaDeDividas extends ChangeNotifier {
  List<Divida> _dividas = [];

  List<Divida> getDividas() => _dividas;

  void adicionaDivida(Divida novaDivida) {
    _dividas.add(novaDivida);
    notifyListeners();
  }

}