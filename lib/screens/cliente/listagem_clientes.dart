import 'package:easycharge/models/clienteApi.dart';
import 'package:flutter/material.dart';

import '../../components/Drawer/custom_drawer.dart';
import '../../components/message.dart';
import '../../components/progresso.dart';
import '../../http/webclient.dart';
import 'formulario_cliente.dart';

class ListagemClientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        actions: <Widget>[
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
       body: FutureBuilder<List<ClienteApi>>(
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progresso();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if(snapshot.hasData){
                final List<ClienteApi> clientes = snapshot.requireData;
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
              return CenteredMessage('Não encontramos nenhum cliente!', icon: Icons.warning,);
          }
          return CenteredMessage('Erro desconhecido!');
        },
      ),
      // Consumer<ListaDeClientesState>(
      //   builder: (context, listaDeClientes, child) {
      //     List<Cliente> clientes = listaDeClientes.getClientes();
      //
      //     return ListView.builder(
      //         itemCount: clientes.length,
      //         itemBuilder: (contextListView, indice) {
      //           return ItemCliente(clientes[indice]);
      //         });
      //   },
      // ),
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
  final ClienteApi _cliente;

  const ItemCliente(this._cliente);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(_cliente.nome),
        subtitle: Text(_cliente.cpf),
        onTap: () {
          showDialog(
              context: context,
              builder: (builder) {
                return AlertDialog(
                  title: Text(_cliente.nome),
                  content: SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text('CPF: ${_cliente.cpf}'),
                          Text('Telefone: ${_cliente.telefone}'),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text('Endereco'),
                          Text('Local: ${_cliente.local}'),
                        ],
                      )
                    ],
                  )),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Sair'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
