import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:provider/provider.dart';

import '../../models/clientes/cliente.dart';
import '../../models/clientes/listaClientes.dart';
import '../../state/wizard_cadastro_cliente.dart';

class Formulario extends StatelessWidget {
  var passoDadosPessoais = _DadosPessoaisForm();
  var passoEndereco = _EnderecoForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de cliente')),
      body: Consumer<WizardCadastroDeClienteState>(
        builder: (context, wizardState, child) {
          return Stepper(
            controlsBuilder: (context, details) {
              bool ultimoPasso = details.currentStep ==
                  1; // Coloca a quantidade de passos menos 1
              String rotuloDoUltimoBotao =
                  ultimoPasso ? 'Cadastrar' : 'Avançar';

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(rotuloDoUltimoBotao),
                  ),
                  ElevatedButton(
                    onPressed: details.onStepCancel,
                    child: Text('Voltar'),
                  ),
                ],
              );
            },
            currentStep: wizardState.passoAtual,
            onStepContinue: () {
              var funcoes = [_salvaPasso1, _salvaPasso2];

              funcoes[wizardState.passoAtual](context);
            },
            onStepCancel: () => wizardState.volta(),
            steps: [
              Step(
                title: Text('Dados Pessoais'),
                content: passoDadosPessoais,
              ),
              Step(
                title: Text('Endereço'),
                content: passoEndereco,
              ),
            ],
          );
        },
      ),
    );
  }

  void _salvaPasso1(BuildContext context) {
    if (passoDadosPessoais.isValido()) {
      WizardCadastroDeClienteState state =
          Provider.of<WizardCadastroDeClienteState>(context, listen: false);
      passoDadosPessoais.armazenaDadosNoWizard(context);

      state.avanca();
    }
  }

  void _salvaPasso2(BuildContext context) {
    WizardCadastroDeClienteState state =
        Provider.of<WizardCadastroDeClienteState>(context, listen: false);
    Cliente cliente = state.criaCliente();

    var listaDeClientes = Provider.of<ListaDeClientes>(context, listen: false);
    listaDeClientes.adicionaCliente(cliente);

    Navigator.of(context).pop();
  }
}

class _DadosPessoaisForm extends StatelessWidget {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _profissaoController = TextEditingController();
  TextEditingController _rendaController = TextEditingController();
  TextEditingController _statusController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: 'Nome'),
            maxLength: 100,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o nome!';
              }

              if (!value.contains(" "))
                return 'Informe pelo menos um sobrenome';
              return null;
            },
          ),
          TextFormField(
            controller: _cpfController,
            decoration:
                InputDecoration(labelText: 'CPF', hintText: '000.000.000-00'),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter()
            ],
            maxLength: 14,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            controller: _telefoneController,
            decoration: InputDecoration(
                labelText: 'Telefone', hintText: '(99) 9999-9999'),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter()
            ],
            validator: (value) =>
                Validator.phone(value) ? 'Telefone inválido' : null,
            maxLength: 15,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              maxLength: 35,
              validator: (value) =>
                  Validator.email(value) ? 'Email inválido' : null),
          TextFormField(
            controller: _profissaoController,
            decoration: InputDecoration(
                labelText: 'Profissão', hintText: 'Programador'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o nome!';
              }
              return null;
            },
            maxLength: 20,
            keyboardType: TextInputType.text,
          ),
          TextFormField(
            controller: _rendaController,
            decoration:
                InputDecoration(labelText: 'Renda', hintText: 'RS: 0,00'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o nome!';
              }
              return null;
            },
            maxLength: 14,
            keyboardType: TextInputType.number,
          ),
          DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(labelText: 'Status'),
            items: ['ATIVO', 'SUSPENSO'].map((String status) {
              return DropdownMenuItem(
                child: Text(status),
                value: status,
              );
            }).toList(),
            onChanged: (String novoStatus) {
              _statusController.text = novoStatus;
            },
            validator: (value) {
              if (value == null) return 'Selecione um Status!';

              return null;
            },
          ),
        ],
      ),
    );
  }

  void armazenaDadosNoWizard(context) {
    var state =
        Provider.of<WizardCadastroDeClienteState>(context, listen: false);
    state.nome = _nomeController.text;
    state.cpf = _cpfController.text;
    state.telefone = _telefoneController.text;
    state.email = _emailController.text;
    state.profissao = _profissaoController.text;
    state.renda = _rendaController.text;
    state.status = _statusController.text;
  }

  bool isValido() {
    var currentState = _key.currentState;
    return currentState != null && currentState.validate();
  }
}

class _EnderecoForm extends StatelessWidget {
  TextEditingController _ruaController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();
  TextEditingController _complementoController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: _ruaController,
            decoration: InputDecoration(labelText: 'Rua'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o rua!';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _numeroController,
            decoration: InputDecoration(labelText: 'Número'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o número!';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _complementoController,
            decoration: InputDecoration(labelText: 'Complemento'),
          ),
          TextFormField(
            controller: _bairroController,
            decoration: InputDecoration(labelText: 'Bairro'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o bairro!';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _cidadeController,
            decoration: InputDecoration(labelText: 'Cidade'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a cidade!';
              }
              return null;
            },
          ),
          DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(labelText: 'Estado'),
            items: Estados.listaEstadosSigla.map((String estado) {
              return DropdownMenuItem(
                child: Text(estado),
                value: estado,
              );
            }).toList(),
            onChanged: (String novoEstadoSelecionado) {
              _estadoController.text = novoEstadoSelecionado;
            },
            validator: (value) {
              if (value == null) return 'Selecione um estado!';

              return null;
            },
          ),
        ],
      ),
    );
  }

  void armazenaDadosNoWizard(context) {
    var state =
        Provider.of<WizardCadastroDeClienteState>(context, listen: false);
    state.rua = _ruaController.text;
    state.numero = _numeroController.text;
    state.complemento = _complementoController.text;
    state.bairro = _bairroController.text;
    state.cidade = _cidadeController.text;
    state.estado = _estadoController.text;
  }

  bool isValido() {
    var currentState = _key.currentState;
    return currentState != null && currentState.validate();
  }
}
