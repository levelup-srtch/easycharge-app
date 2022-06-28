import 'package:flutter/material.dart';

import '../../Drawer/custom_drawer.dart';
import '../../models/divida.dart';

class ListaDeDividas extends StatelessWidget {
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
          'Dividas',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      body: Column(
        children: [
          ItemCliente(Divida('R\$ 1536,00', 'ABERTA', '03/08/18')),
          ItemCliente(Divida('R\$ 1065,00', 'ABERTA', '24/07/20')),
          ItemCliente(Divida('R\$ 100,00', 'ABERTA', '01/02/20')),
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
  final Divida _divida;

  ItemCliente(this._divida);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.attach_money_rounded),
        title: Text(_divida.status),
        subtitle: Text('Valor:${_divida.valor} \t Abertura: ${_divida.abertura}'),
      ),
    );
  }
}