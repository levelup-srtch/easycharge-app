import 'package:easycharge/models/cliente.dart';
import 'package:easycharge/models/lista_clientes.dart';
import 'package:easycharge/screens/cliente/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListagemDeClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easycharge - Listagem de clientes'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
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
              return CardDeCliente(todosOsClientes[indice]);
            },
          );
        },
      ),
    );
  }
}

class CardDeCliente extends StatelessWidget {
  Cliente cliente;

  CardDeCliente(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cliente.nome),
        subtitle: Text('CPF: ' + cliente.cpf),
        leading: Icon(Icons.people),
      ),
    );
  }
}
