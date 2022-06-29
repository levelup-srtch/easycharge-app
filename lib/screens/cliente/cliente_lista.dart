import 'package:easycharge/screens/cliente/cliente_formulario.dart';
import 'package:flutter/material.dart';

import '../../database/dao/cliente_dao.dart';
import '../../models/cliente.dart';

class ClientesLista extends StatefulWidget {
  @override
  _ClientesListaState createState() => _ClientesListaState();
}

class _ClientesListaState extends State<ClientesLista> {
  final ClienteDAO _dao = ClienteDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body: FutureBuilder<List<Clientes>>(
        initialData: List(),
        future: _dao.buscarTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Clientes> clientes = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Clientes cliente = clientes[index];
                  return _ClienteItem(cliente);
                },
                itemCount: clientes.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => ClientesFormulario(),
            ),
          )
              .then(
                (value) => setState(() {}),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ClienteItem extends StatelessWidget {
  final Clientes cliente;

  _ClienteItem(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          cliente.nome,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
         cliente.cpf.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

