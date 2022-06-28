import 'package:flutter/material.dart';

import '../../database/app_database.dart';
import '../../models/cliente.dart';
import 'cliente_formulario.dart';

class ClientesLista extends StatelessWidget {
  final List<Clientes> clientes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Clientes'),
        ),
      ),
      body: FutureBuilder<List<Clientes>>(
        initialData: [],
        future: buscarTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando')
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Clientes> clientes = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Clientes cliente = clientes[index];
                  return _ClienteItem(cliente);
                },
                itemCount: clientes.length,
              );
          }
          return const Text('Uknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ClientesFormulario(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ClienteItem extends StatelessWidget {
  final Clientes clientes;

  const _ClienteItem(this.clientes);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          clientes.nome,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          clientes.cpf.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
