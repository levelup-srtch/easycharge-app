import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cliente.dart';
import '../../models/listaClientes.dart';


class FormularioDeCliente extends StatelessWidget {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  bool _validaCampos(){
    if (_cpfController.text.length > 0 && _nomeController.text.length > 0)
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de cliente')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _cpfController,
              decoration: InputDecoration(
                labelText: 'CPF',
                hintText: '000.000.000-00',
                ),
              maxLength: 14,
              keyboardType: TextInputType.number
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () {
                if(_validaCampos()) {
                  debugPrint('CADASTROU...');
                  String cpfDoCliente = _cpfController.text;
                  String nomeDoCliente = _nomeController.text;

                  Cliente novoCliente = Cliente(nomeDoCliente, cpfDoCliente);

                  ListaDeClientes listaClientes = Provider.of<ListaDeClientes>(
                      context, listen: false);
                  listaClientes.adicionaCliente(novoCliente);

                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('ATENÇÃO'),
                        content: Text('Todos os campos devem ser preenchidos!'),
                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            child: Text('Fechar'),
                          )
                        ],
                      );
                    }
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}