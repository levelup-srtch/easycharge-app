import '../../models/cliente.dart';
import '../app_database.dart';

class ClienteDAO{

  static const String tabelaSql = 'CREATE TABLE $_tabelaName('
      '$_id INTEGER PRIMARY key AUTOINCREMENT,'
      '$_nome TEXT,'
      '$_cpf INTEGER,)';

  static const String _tabelaName = 'clientes';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _cpf = 'cpf';

  Future<int> salvar(Clientes clientes)  {
    return createDatabase().then((db){
      Map<String, dynamic> clientesMap = _toMap(clientes);
      return db.insert(_tabelaName, clientesMap);
    });
  }

  Map<String, dynamic> _toMap(Clientes clientes) {
    final Map<String, dynamic> clientesMap = {};
    clientesMap[_nome] = clientes.nome;
    clientesMap[_cpf] = clientes.cpf;
    return clientesMap;
  }

  Future<List<Clientes>> buscarTodos() {
    return createDatabase().then((db) {
      return db.query(_tabelaName).then((maps) {
        final List<Clientes> cliente = [];
        _toList(maps, cliente);
        return cliente;
      });
    });
  }

  void _toList(List<Map<String, Object>> maps, List<Clientes> cliente) {
    for (Map<String, dynamic> map in maps) {
      final Clientes clientes = Clientes(
        map[_id],
        map[_nome],
        map[_cpf],
      );
      cliente.add(clientes);
    }
  }

}