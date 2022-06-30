import 'package:easycharge/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/listaClientes.dart';
import 'formulario.dart';

class ListagemDeClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de clientes'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FormularioDeCliente();
          }));
        },
      ),
      body: Consumer<ListaDeClientes>(
        builder: (context, listaDeClientes, child) {
          List<Cliente> todosOsClientes = listaDeClientes.getClientes();

          return ListView.builder(
            itemCount: todosOsClientes.length,
            itemBuilder: (contextListView, indice) {
              return ItemCliente(todosOsClientes[indice]);
            },
          );
        },
      ),
    );
  }
}

class ItemCliente extends StatelessWidget {
  final Cliente cliente;

  ItemCliente(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.people),
        title: Text(cliente.nome),
        subtitle: Text('CPF: ' + cliente.cpf)
      ),
    );
  }
}

