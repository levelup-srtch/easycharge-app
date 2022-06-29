import 'package:flutter/material.dart';

import '../../database/dao/cliente_dao.dart';
import '../../models/cliente.dart';

class ClientesFormulario extends StatefulWidget {
  @override
  _ClientesFormularioState createState() => _ClientesFormularioState();
}

class _ClientesFormularioState extends State<ClientesFormulario> {
  final TextEditingController _nomeControlador = TextEditingController();
  final TextEditingController _cpfControlador = TextEditingController();
  final ClienteDAO _dao = ClienteDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Novo Cliente'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeControlador,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _cpfControlador,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    final String nome = _nomeControlador.text;
                    final String cpf = _cpfControlador.text;
                    final Clientes novoCliente = Clientes(0, nome, cpf);
                    _dao
                        .salvar(novoCliente)
                        .then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
