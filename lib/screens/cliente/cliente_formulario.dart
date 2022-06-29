import 'package:easycharge/database/dao/cliente_dao.dart';
import 'package:flutter/material.dart';

import '../../models/cliente.dart';

class ClientesFormulario extends StatefulWidget {
  @override
  State<ClientesFormulario> createState() => _ClientesFormularioState();
}

class _ClientesFormularioState extends State<ClientesFormulario> {
  final TextEditingController _nomeControlador = TextEditingController();
  final TextEditingController _cpfControlador = TextEditingController();
  final ClienteDAO _dao = ClienteDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Novo Cliente'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: TextField(
                controller: _nomeControlador,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: TextField(
                controller: _cpfControlador,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF',
                ),
                style: const TextStyle(fontSize: 16),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  final String nome = _nomeControlador.text;
                  final String cpf = _cpfControlador.text;

                  final Clientes novoCliente = Clientes(0, nome, cpf);
                  _dao.salvar(novoCliente).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
