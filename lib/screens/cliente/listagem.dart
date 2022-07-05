import 'package:easycharge/models/cliente.dart';
import 'package:easycharge/screens/autenticacao/formulario_login.dart';
import 'package:easycharge/screens/cliente/formulario.dart';
import 'package:easycharge/service/autenticacao_service.dart';
import 'package:easycharge/state/lista_clientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListagemDeClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de clientes'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AutenticacaoService.limpaAutenticacao();

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (ctx) => FormularioDeLogin()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FormularioDeCliente();
          }));
        },
      ),
      body: Consumer<ListaDeClientesState>(
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
