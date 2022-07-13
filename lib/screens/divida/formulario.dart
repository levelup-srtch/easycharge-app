import 'package:brasil_fields/brasil_fields.dart';
import 'package:easycharge/models/divida.dart';
import 'package:easycharge/state/listaDividas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FormularioDeDivida extends StatelessWidget {
  TextEditingController _valorController = TextEditingController();
  TextEditingController _dataAberturaController = TextEditingController();
  TextEditingController _dataQuitacaoController = TextEditingController();
  TextEditingController _descricaoQuitacaoController = TextEditingController();
  TextEditingController _clienteController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de divida')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _construirFormulario(context),
            _cadastrar(context)
          ],
        ),
      ),
    );
  }

  Widget _construirFormulario(context) {
    return Form(
      key: _formkey,
      child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),

              child: TextFormField(
                controller: _valorController,
                decoration: InputDecoration(labelText: 'Valor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o valor!';
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter(moeda: true)
                ],
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),

              child: TextFormField(
                controller: _dataAberturaController,
                decoration: InputDecoration(labelText: 'Data Abertura'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a data!';
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter()
                ],
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),

              child: TextFormField(
                controller: _dataQuitacaoController,
                decoration: InputDecoration(labelText: 'Data Quitação'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter()
                ],
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),

              child: TextFormField(
                controller: _descricaoQuitacaoController,
                decoration: InputDecoration(labelText: 'Descrição da quitação'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a descrição da quitação!';
                  }
                },
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),

              child: TextFormField(
                controller: _clienteController,
                decoration: InputDecoration(labelText: 'Nome do cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome do cliente!';
                  }
                },
                keyboardType: TextInputType.text,
              ),
            ),
          ]
      ),);
  }

  Widget _cadastrar(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: ElevatedButton(
        child: Text('Cadastrar'),
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            debugPrint('CADASTROU...');
            String valor = _valorController.text;
            String dataAbertura = _dataAberturaController.text;
            String dataQuitacao = _dataQuitacaoController.text;
            String descricaoQuitacao = _descricaoQuitacaoController.text;
            String cliente = _clienteController.text;

            Divida novaDivida = Divida(valor, dataAbertura, dataQuitacao, descricaoQuitacao, cliente);

            ListaDeDividas listaDividas = Provider.of<ListaDeDividas>(
            context, listen: false);
            listaDividas.adicionaDivida(novaDivida);

            Navigator.pop(context);
            }
          },
      ),
    );
  }
}
