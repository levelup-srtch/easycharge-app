import 'package:brasil_fields/brasil_fields.dart';
import 'package:easycharge/http/webclient.dart';
import 'package:easycharge/screens/cliente/listagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:provider/provider.dart';

import '../../models/cliente.dart';
import '../../state/listaClientes.dart';
import '../../state/wizard_cadastro_cliente.dart';

class FormularioDeCliente extends StatefulWidget {
  @override
  State<FormularioDeCliente> createState() => _FormularioDeClienteState();
}

class _FormularioDeClienteState extends State<FormularioDeCliente> {
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
                    onPressed: details.onStepCancel,
                    child: Text('Voltar'),
                  ),
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(rotuloDoUltimoBotao),
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
      passoDadosPessoais.armazenaDadosNoWizard(state);

      state.avanca();
    }
  }

  void _salvaPasso2(BuildContext context) {
    if (passoEndereco.isValido()) {
      WizardCadastroDeClienteState state =
          Provider.of<WizardCadastroDeClienteState>(context, listen: false);
      passoEndereco.armazenaDadosNoWizard(state);
      Cliente cliente = state.criaCliente();

      cadastroCliente(cliente);

      var listaDeClientes =
          Provider.of<ListaDeClientes>(context, listen: false);
      listaDeClientes.adicionaCliente(cliente);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ListagemDeClientes()),
          (route) => false);
    }
  }
}

class _DadosPessoaisForm extends StatelessWidget {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _cargoController = TextEditingController();
  TextEditingController _rendaController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o nome!';
                }

                if (!value.contains(" "))
                  return 'Informe pelo menos um sobrenome';
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _cpfController,
              decoration:
                  InputDecoration(labelText: 'CPF', hintText: '000.000.000-00'),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              validator: (value) =>
                  Validator.cpf(value) ? 'CPF inválido' : null,
              maxLength: 14,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    Validator.email(value) ? 'Email inválido' : null),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _telefoneController,
              decoration: InputDecoration(
                  labelText: 'Telefone', hintText: '(99) 9999-9999'),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter()
              ],
              validator: (value) =>
                  Validator.phone(value) ? 'Telefone inválido' : null,
              maxLength: 14,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _cargoController,
              decoration: InputDecoration(labelText: 'Cargo'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o cargo!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _rendaController,
              decoration: InputDecoration(labelText: 'Renda'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o cargo!';
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter(moeda: true)
              ],
              keyboardType: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }

  void armazenaDadosNoWizard(state) {
    state.nome = _nomeController.text;
    state.cpf = _cpfController.text;
    state.email = _emailController.text;
    state.telefone = _telefoneController.text;
    state.profissao = _cargoController.text;
    state.renda = _rendaController.text;
  }

  bool isValido() {
    var currentState = _key.currentState;
    return currentState != null && currentState.validate();
  }
}

class _EnderecoForm extends StatelessWidget {
  TextEditingController _ruaController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();
  TextEditingController _complementoController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _estadoController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _ruaController,
              decoration: InputDecoration(labelText: 'Rua'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o rua!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _bairroController,
              decoration: InputDecoration(labelText: 'Bairro'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o bairro!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _numeroController,
              decoration: InputDecoration(labelText: 'Número'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o número!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _complementoController,
              decoration: InputDecoration(labelText: 'Complemento'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35),
            child: TextFormField(
              controller: _cidadeController,
              decoration: InputDecoration(labelText: 'Cidade'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe a cidade!';
                }
              },
            ),
          ),
          DropdownButtonFormField(
            hint: Text('Estado'),
            isExpanded: true,
            items: Estados.listaEstadosSigla
                .map<DropdownMenuItem<String>>((String estado) {
              return DropdownMenuItem<String>(
                value: estado,
                child: Text(estado),
              );
            }).toList(),
            onChanged: (String? estadoSelecionado) {
              assert(estadoSelecionado != null);
              _estadoController.text = estadoSelecionado!;
            },
            validator: (value) {
              if (value == null) {
                return 'Selecione um estado!';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void armazenaDadosNoWizard(state) {
    state.rua = _ruaController.text;
    state.bairro = _bairroController.text;
    state.numero = _numeroController.text;
    state.cidade = _cidadeController.text;
    state.estado = _estadoController.text;
    state.complemento = _complementoController.text;
  }

  bool isValido() {
    var currentState = _key.currentState;
    return currentState != null && currentState.validate();
  }
}
