import 'package:easycharge/models/divida.dart';
import 'package:easycharge/models/listaDividas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioDeDivida extends StatelessWidget {
  TextEditingController nomeClienteController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Easycharge - Cadastro de dividas')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: valorController,
              decoration: InputDecoration(
                labelText: 'Valor:',
                hintText: '000.00',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: nomeClienteController,
              decoration: InputDecoration(labelText: 'Nome Cliente:'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () {
                debugPrint('CADASTROU...');
                String valorDaDivida = valorController.text;
                String nomeDoCliente = nomeClienteController.text;

                Divida novaDivida = Divida(nomeDoCliente, valorDaDivida);

                ListaDeDividas listaDividas = Provider.of<ListaDeDividas>(context, listen: false);
                listaDividas.adicionaDivida(novaDivida);

                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}