
import 'package:brasil_fields/brasil_fields.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';


class Divida {

  String _valor;
  String _dataAbertura;
  String _dataQuitacao;
  late String _statusDivida;
  String _descricaoQuitacao;
  String _cliente;

  Divida(this._valor, this._dataAbertura, this._dataQuitacao, this._descricaoQuitacao, this._cliente);

  String get cliente => _cliente;

  set cliente(String value) {
    _cliente = value;
  }

  String get descricaoQuitacao => _descricaoQuitacao;

  set descricaoQuitacao(String value) {
    _descricaoQuitacao = value;
  }

  String get statusDivida => _statusDivida;

  set statusDivida(String value) {
    _statusDivida = value;
  }

  String get dataQuitacao => _dataQuitacao;

  set dataQuitacao(String value) {
    _dataQuitacao = value;
  }


  String get dataAbertura => _dataAbertura;

  set dataAbertura(String value) {
    _dataAbertura = value;
  }

  String get valor => _valor;

  set valor(String value) {
    _valor = value;
  }

  Map<String, dynamic> mapperJson(){
    var inputFormat = DateFormat('dd/MM/yyyy');
    var inputDate = inputFormat.parse(_dataAbertura);
    var outputFormat = DateFormat('yyyy-MM-dd');
    var f = outputFormat.format(inputDate);

    if (_dataQuitacao.isNotEmpty){
      var data = inputFormat.parse(_dataQuitacao);
      var dataForm = DateFormat('yyyy-MM-dd');
      var q = dataForm.format(data);
      _dataQuitacao = q;
    }

    return{
      'valor' : UtilBrasilFields.converterMoedaParaDouble(_valor),
      'dataAbertura' : f,
      'dataQuitacao' : _dataQuitacao,
      'descricaoQuitacao' : _descricaoQuitacao,
      'idCliente' : _cliente
    };
  }
}
