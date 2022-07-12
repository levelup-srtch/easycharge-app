import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/dividas/dividas.dart';
import '../../models/dividas/listaDividas.dart';

class FormularioDeDivida extends StatelessWidget {
  TextEditingController _nomeClienteController = TextEditingController();
  TextEditingController _valorController = TextEditingController();

  bool _validaCampos(){
    if (_nomeClienteController.text.length > 0 && _valorController.text.length > 0)
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de divida')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _nomeClienteController,
              maxLength: 100,
              decoration: InputDecoration(labelText: 'Nome Cliente:'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _valorController,
              decoration: InputDecoration(
                labelText: 'Valor:',
                hintText: '000.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () {
                if(_validaCampos()) {
                  debugPrint('CADASTROU...');
                  String valorDaDivida = _valorController.text;
                  String nomeDoCliente = _nomeClienteController.text;

                  Divida novaDivida = Divida(nomeDoCliente, valorDaDivida);

                  ListaDeDividas listaDividas = Provider.of<ListaDeDividas>(
                      context, listen: false);
                  listaDividas.adicionaDivida(novaDivida);

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