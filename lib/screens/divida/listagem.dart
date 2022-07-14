import 'package:easycharge/http/divida_webclient.dart';
import 'package:easycharge/models/divida.dart';
import 'package:easycharge/models/dividaJson.dart';
import 'package:easycharge/state/listaDividas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/messageCenter.dart';
import '../../components/progress.dart';
import 'formulario.dart';

class ListagemDeDividas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de dividas'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FormularioDeDivida();
          }));
        },
      ),
      body: FutureBuilder<List<DividaJson>>(
        future: findAllDividas(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if(snapshot.hasData){
                final List<DividaJson> dividas = snapshot.requireData;
                if (dividas.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: dividas.length,
                      itemBuilder: (contextListView, indice) {
                        return ItemDivida(dividas[indice]);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                    ),
                  );
                }
              }
              return MessageCenter('Nenhum cliente foi encontrado!', icon: Icons.warning,);
          }
          return MessageCenter('Erro desconhecido!');
        },
      ),
    );
  }
}

class ItemDivida extends StatelessWidget {
  DividaJson _divida;

  ItemDivida(this._divida);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: const Icon(Icons.monetization_on),
          title: Text(_divida.statusDivida),
          subtitle: Text('Valor: ' + _divida.valor.toString())
      ),
    );
  }
}
