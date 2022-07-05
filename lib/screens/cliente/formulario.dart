import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/clientes/cliente.dart';
import '../../models/clientes/listaClientes.dart';
import '../../state/wizard_cadastro_cliente.dart';

class Formulario extends StatelessWidget {

  var passoCpf = _CpfForm();
  var passoNome = _NomeForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de clientes')),
      body: Consumer<WizardCadastroDeClienteState>(
        builder: (context, wizardState, child) {
          return Stepper(
            currentStep: wizardState.passoAtual,
            onStepContinue: () {
              var funcoes = [_salvaPasso1, _salvaPasso2];

              funcoes[wizardState.passoAtual](context);
            },
            onStepCancel: () => wizardState.volta(),
            steps: [
              Step(
                title: Text('Dados pessoais'),
                content: passoCpf,
              ),
              Step(
                title: Text('Endereço'),
                content: passoNome,
              ),
            ],
          );
        },
      ),
    );
  }

  void _salvaPasso1(BuildContext context) {
    if (passoCpf.isValido()) {
      WizardCadastroDeClienteState state = Provider.of<WizardCadastroDeClienteState>(context, listen: false);
      passoCpf.armazenaDadosNoWizard(context);

      state.avanca();
    }
  }

  void _salvaPasso2(BuildContext context) {
    WizardCadastroDeClienteState state = Provider.of<WizardCadastroDeClienteState>(context, listen: false);
    passoNome.armazenaDadosNoWizard(context);

    Cliente cliente = state.criaCliente();

    var listaClientes = Provider.of<ListaDeClientes>(context, listen: false);
    listaClientes.adicionaCliente(cliente);

    Navigator.of(context).pop();
  }
}

class _CpfForm extends StatelessWidget {
  TextEditingController _cpfController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
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
    );
  }

  void armazenaDadosNoWizard(context) {
    var state = Provider.of<WizardCadastroDeClienteState>(context, listen: false);
    state.cpf = _cpfController.text;
  }

  bool isValido() {
    var currentState = _key.currentState;
    return currentState != null && currentState.validate();
  }
}

class _NomeForm extends StatelessWidget {
  TextEditingController _nomeController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          controller: _nomeController,
          decoration: InputDecoration(labelText: 'Nome'),
          validator: (valor) => valor == null || valor.trim().isEmpty ? 'Nome inválido' : null,
        ),
      ),
    );
  }

  void armazenaDadosNoWizard(context) {
    var state = Provider.of<WizardCadastroDeClienteState>(context, listen: false);
    state.nome = _nomeController.text;
  }

  bool isValido() {
    var currentState = _key.currentState;
    return currentState != null && currentState.validate();
  }
}