import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cliente.dart';
import '../../models/listaClientes.dart';


class FormularioDeCliente extends StatelessWidget {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Easycharge - Cadastro de clientes')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: cpfController,
              decoration: InputDecoration(
                labelText: 'CPF',
                hintText: '000.000.000-00',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () {
                debugPrint('CADASTROU...');
                String cpfDoCliente = cpfController.text;
                String nomeDoCliente = nomeController.text;

                Cliente novoCliente = Cliente(nomeDoCliente, cpfDoCliente);

                ListaDeClientes listaClientes = Provider.of<ListaDeClientes>(context, listen: false);
                listaClientes.adicionaCliente(novoCliente);

                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}