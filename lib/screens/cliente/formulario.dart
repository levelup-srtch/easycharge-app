import 'package:easycharge/models/cliente.dart';
import 'package:easycharge/models/lista_clientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioDeCliente extends StatelessWidget {

  TextEditingController _cpfController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Easycharge - Cadastro de clientes')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _cpfController,
              decoration: InputDecoration(
                labelText: 'CPF',
                hintText: '000.000.000-00',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () {
                debugPrint('CADASTROU...');
                String cpfDoCliente = _cpfController.text;
                String nomeDoCliente = _nomeController.text;

                Cliente novoCliente = Cliente(nomeDoCliente, cpfDoCliente);

                ListaDeClientes listaDeClientes = Provider.of<ListaDeClientes>(context, listen: false);
                listaDeClientes.adicionaCliente(novoCliente);

                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
