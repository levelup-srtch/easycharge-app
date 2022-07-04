import 'package:easycharge/models/clientes/cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/clientes/listaClientes.dart';
import 'formulario.dart';

class ListaClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clientes'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Formulario(),
              ),
            );
          },
          label: Text('Novo Clinete'),
          icon: Icon(Icons.person_rounded),
        ),
        body: Consumer<ListaDeClientes>(
            builder: (context, listaDeClientes, child) {
          List<Cliente> todosClientes = listaDeClientes.getClientes();

          return ListView.builder(
              itemCount: todosClientes.length,
              itemBuilder: (contextListView, index) {
                return ItemCliente(todosClientes[index]);
              });
        }));
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
          subtitle: Text('CPF: ' + cliente.cpf)),
    );
  }
}
