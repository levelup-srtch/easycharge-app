import 'package:flutter/material.dart';

import '../../components/messageCenter.dart';
import '../../components/progress.dart';
import '../../http/cliente_webclient.dart';
import '../../models/clienteJson.dart';
import 'formulario.dart';

class ListagemDeClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de clientes'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FormularioDeCliente();
          }));
        },
      ),
      body: FutureBuilder<List<ClienteJson>>(
        future: findAll(),
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
                final List<ClienteJson> clientes = snapshot.requireData;
                if (clientes.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: clientes.length,
                      itemBuilder: (contextListView, indice) {
                        return ItemCliente(clientes[indice]);
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
      // body: Consumer<ListaDeClientes>(
      //   builder: (context, listaDeClientes, child) {
      //     List<Cliente> todosOsClientes = listaDeClientes.getClientes();
      //
      //     return ListView.builder(
      //       itemCount: todosOsClientes.length,
      //       itemBuilder: (contextListView, indice) {
      //         return ItemCliente(todosOsClientes[indice]);
      //       },
      //     );
      //   },
      // ),
    );
  }
}


class ItemCliente extends StatelessWidget {
  final ClienteJson _cliente;

  ItemCliente(this._cliente);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person_outlined),
        title: Text(_cliente.nome),
        subtitle: Text('CPF: ' + _cliente.cpf),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FormularioDeCliente())
          );
        },
      ),
    );
  }
}

