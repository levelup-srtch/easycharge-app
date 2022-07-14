class DividaJson {

  double _valor;
  String _dataAbertura;
  String? _dataQuitacao;
  late String _statusDivida;
  String _descricaoQuitacao;
  int _cliente;

  DividaJson(this._valor, this._dataAbertura, this._dataQuitacao, this._statusDivida, this._descricaoQuitacao, this._cliente);


  int get cliente => _cliente;

  set cliente(int value) {
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

  String? get dataQuitacao => _dataQuitacao;

  set dataQuitacao(String? value) {
    _dataQuitacao = value;
  }


  String get dataAbertura => _dataAbertura;

  set dataAbertura(String value) {
    _dataAbertura = value;
  }

  double get valor => _valor;

  set valor(double value) {
    _valor = value;
  }
}
