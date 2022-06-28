import 'package:flutter/material.dart';

import '../../Drawer/custom_drawer.dart';
import '../../models/cliente.dart';

class ListaDeClientes extends StatelessWidget {
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
      body: Column(
        children: [
          ItemCliente(Cliente('Caio', '0664939166')),
          ItemCliente(Cliente('Mary', '83152539134')),
          ItemCliente(Cliente('Berg', '49486225168')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
