import 'package:easycharge/models/divida.dart';
import 'package:easycharge/models/listaDividas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListagemDeDividas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easycharge - Listagem de dividas'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FormularioDeDivida();
          }));
        },
      ),
      body: Consumer<ListaDeDividas>(
        builder: (context, listaDeDividas, child) {
          List<Divida> todasAsDividas = listaDeDividas.getDividas();

          return ListView.builder(
            itemCount: todasAsDividas.length,
            itemBuilder: (contextListView, indice) {
              return ItemDivida(todasAsDividas[indice]);
            },
          );
        },
      ),
    );
  }
}

class ItemDivida extends StatelessWidget {
  final Divida divida;

  ItemDivida(this.divida);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: const Icon(Icons.people),
          title: Text(divida.nomeCliente),
          subtitle: Text('Valor: ' + divida.valor)
      ),
    );
  }
}