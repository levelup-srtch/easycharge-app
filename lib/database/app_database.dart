import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/cliente.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'easycharger.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE clientes('
          'id INTEGER PRIMARY key AUTOINCREMENT,'
          'nome TEXT,'
          'cpf INTEGER,'
          'telefone INTEGER,'
          'email TEXT,'
          'profissao TEXT,'
          'renda INTEGER,'
          'status TEXT,'
          'rua TEXT,'
          'numero INTEGER,'
          'complemento TEXT,'
          'bairro TEXT,'
          'cidade TEXT,'
          'estado TEXT)');
    }, version: 1,
        // onDowngrade: onDatabaseDowngradeDelete
    );
  });
}

Future<int> salvar(Clientes clientes) {
  return createDatabase().then((db) {
    final Map<String, dynamic> clientesMap = {};
    clientesMap['nome'] = clientes.nome;
    clientesMap['cpf'] = clientes.cpf;
    return db.insert('clientes', clientesMap);
  });
}

Future<List<Clientes>> buscarTodos() {
  return createDatabase().then((db) {
    return db.query('clientes').then((maps) {
      final List<Clientes> cliente = [];
      for (Map<String, dynamic> map in maps) {
        final Clientes clientes = Clientes(
          map['id'],
          map['nome'],
          map['cpf'],
        );
        cliente.add(clientes);
      }
      return cliente;
    });
  });
}
