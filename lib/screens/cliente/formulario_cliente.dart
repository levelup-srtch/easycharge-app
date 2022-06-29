import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cliente.dart';
import '../../models/lista_clientes.dart';

class FormularioCliente extends StatelessWidget {
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Easycharge - Cadastro de clientes')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _cpfController,
              decoration: const InputDecoration(
                labelText: 'CPF',
                hintText: '000.000.000-00',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: ElevatedButton(
              child: const Text('Cadastrar'),
              onPressed: () {
                String cpfDoCliente = _cpfController.text;
                String nomeDoCliente = _nomeController.text;

                Cliente novoCliente = Cliente(nomeDoCliente, cpfDoCliente);

                ListaDeClientes listaDeClientes =
                    Provider.of<ListaDeClientes>(context, listen: false);
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
