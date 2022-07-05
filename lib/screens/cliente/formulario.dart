import 'package:easycharge/models/cliente.dart';
import 'package:easycharge/state/lista_clientes.dart';
import 'package:easycharge/state/wizard_cadastro_cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioDeCliente extends StatelessWidget {

  var passoCpf = _CpfForm();
  var passoNome = _NomeForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Easycharge - Cadastro de clientes')),
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
                title: Text('Identificação'),
                content: passoCpf,
              ),
              Step(
                title: Text('Dados pessoais'),
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
    Cliente cliente = state.criaCliente();

    var listaDeClientes = Provider.of<ListaDeClientesState>(context, listen: false);
    listaDeClientes.adicionaCliente(cliente);

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
          validator: (valor) => valor == null || valor.length < 2 ? 'Nome inválido' : null,
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
        child: TextField(
          controller: _nomeController,
          decoration: InputDecoration(labelText: 'Nome'),
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
