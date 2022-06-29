import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/Drawer/custom_drawer.dart';
import '../../models/cliente.dart';
import 'package:easycharge/models/lista_clientes.dart';
import 'formulario_cliente.dart';

class ListagemClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        // Barra Inicial
        actions: <Widget>[
          //Mudando o icone do EndDrawer
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.dehaze_sharp),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        title: const Text(
          'Clientes',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      body: Consumer<ListaDeClientes>(
        builder: (context, listaDeClientes, child) {
          List<Cliente> clientes = listaDeClientes.getClientes();

          return ListView.builder(
              itemCount: clientes.length,
              itemBuilder: (contextListView, indice) {
                return ItemCliente(clientes[indice]);
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FormularioCliente();
          }));
        },
        backgroundColor: Colors.black54,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemCliente extends StatelessWidget {
  final Cliente _cliente;

  ItemCliente(this._cliente);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(_cliente.nome),
        subtitle: Text(_cliente.cpf),
      ),
    );
  }
}
