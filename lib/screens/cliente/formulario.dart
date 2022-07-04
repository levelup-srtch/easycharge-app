import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Formulario extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de Cliente')),
      body:
        FormularioDeCliente(),
      );
  }
}

class FormularioDeCliente extends StatefulWidget {


  @override
  State<FormularioDeCliente> createState() => _FormularioDeClienteState();
}

class _FormularioDeClienteState extends State<FormularioDeCliente> {
  final _formCliente = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _profissaoController = TextEditingController();
  final TextEditingController _rendaController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();

  final _formEndereco = GlobalKey<FormState>();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Seus dados'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome Completo',
                    ),
                    controller: _nomeController,
                    maxLength: 255,
                    keyboardType: TextInputType.text,
                    validator: (value) {

                      if (!value.contains(" "))
                        return 'Informe pelo menos um sobrenome!';

                      if (value.isEmpty)
                        return 'Campo Obrigatório';
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CPF',
                    ),
                    controller: _cpfController,
                    maxLength: 14,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.length != 14)
                        return 'CPF inválido';

                      if (value.isEmpty)
                        return 'Campo Obrigatório';

                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Celular',
                    ),
                    controller: _telefoneController,
                    maxLength: 15,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.length < 12)
                        return 'Celular inválido';

                      if (value.isEmpty)
                        return 'Campo Obrigatório';

                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    controller: _emailController,
                    maxLength: 50,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!value.contains("@") || !value.contains('.'))
                        return 'Email inválido!';

                      if (value.isEmpty) return 'Email muito curto!';

                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Profissão',
                    ),
                    controller: _profissaoController,
                    maxLength: 255,
                    keyboardType: TextInputType.text,
                    validator: (value) {

                      if (value.isEmpty)
                        return 'Campo Obrigatório';
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Renda',
                    ),
                    controller: _rendaController,
                    maxLength: 255,
                    keyboardType: TextInputType.number,
                    validator: (value) {

                      if (value.isEmpty)
                        return 'Campo Obrigatório';
                      return null;
                    },
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
                      if (value == null)
                        return 'Selecione um estado!';

                      return null;
                    },
                  ),
                ]
              ),
          ),
        ), Step(
          title: Text('Endereço'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Rua',
                  ),
                  controller: _ruaController,
                  maxLength: 55,
                  keyboardType: TextInputType.text,
                  validator: (value) {

                    if (value.isEmpty)
                      return 'Campo Obrigatório';
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Número',
                  ),
                  controller: _numeroController,
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  validator: (value) {

                    if (value.isEmpty)
                      return 'Campo Obrigatório';
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Complemento',
                  ),
                  controller: _complementoController,
                  maxLength: 25,
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Bairro',
                  ),
                  controller: _bairroController,
                  maxLength: 55,
                  keyboardType: TextInputType.text,
                  validator: (value) {

                    if (value.isEmpty)
                      return 'Campo Obrigatório';
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Cidade',
                  ),
                  controller: _cidadeController,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  validator: (value) {

                    if (value.isEmpty)
                      return 'Campo Obrigatório';
                    return null;
                  },
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: InputDecoration(labelText: 'Estado'),
                  items:  Estados.listaEstadosSigla.map((String estado) {
                   return DropdownMenuItem(
                       child: Text(estado),
                      value: estado,
                   );
                  }).toList(),
                  onChanged: (String novoEstadoSelecionado) {
                    _estadoController.text = novoEstadoSelecionado;
                  },
                  validator: (value) {
                    if (value == null)
                      return 'Selecione um estado!';

                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

