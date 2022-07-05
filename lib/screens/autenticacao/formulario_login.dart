import 'package:easycharge/models/cliente.dart';
import 'package:easycharge/screens/cliente/listagem.dart';
import 'package:easycharge/service/autenticacao_service.dart';
import 'package:easycharge/state/lista_clientes.dart';
import 'package:easycharge/state/wizard_cadastro_cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormularioDeLogin extends StatelessWidget {
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Easycharge - Login')),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _cpfController,
                validator: (valor) => valor == null || valor.length < 14 ? 'CPF inválido' : null,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  hintText: '000.000.000-00',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _senhaController,
                validator: (valor) => valor == null || valor.isEmpty ? 'Senha inválida' : null,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: ElevatedButton(
                child: Text('Efetuar Login'),
                onPressed: () async {
                  if (_cpfController.text == '123.123.123-33' && _senhaController.text == '123') {
                    await AutenticacaoService.registraAutenticacao();

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => ListagemDeClientes(),
                      ),
                      (route) => false,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
