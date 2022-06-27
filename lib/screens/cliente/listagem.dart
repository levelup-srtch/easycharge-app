import 'package:easycharge/models/cliente.dart';
import 'package:flutter/material.dart';

class ListagemDeClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easycharge - Listagem de clientes'),
      ),
      body: ListView(
        children: [
          CardDeCliente(Cliente('Cácio Costa', '123.123.123-33')),
          CardDeCliente(Cliente('Olívia Fera do Flutter', '333.666.999-00'))
        ],
      ),
    );
  }
}

class CardDeCliente extends StatelessWidget {

  Cliente cliente;
  CardDeCliente(this.cliente);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        title: Text(cliente.nome),
        subtitle: Text('CPF: ' + cliente.cpf),
        leading: Icon(Icons.people),
      ),
    );
  }

}