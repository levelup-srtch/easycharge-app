import 'package:easycharge/models/cliente.dart';
import 'package:flutter/material.dart';

class ListaClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
      ),
      body: Column(
        children: [
          ItemCliente(Cliente('José Roberto', '031.845.201-45')),
          ItemCliente(Cliente('Claudia Silva', '090.651.414-21')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
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
        subtitle: Text('CPF: ' + cliente.cpf),
      ),
    );
  }
}

