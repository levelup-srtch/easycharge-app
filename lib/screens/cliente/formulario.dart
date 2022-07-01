import 'package:brasil_fields/brasil_fields.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/cliente.dart';
import '../../models/listaClientes.dart';

class FormularioDeCliente extends StatefulWidget{
  @override
  FormularioDeClienteState createState() =>FormularioDeClienteState();
}
class FormularioDeClienteState extends State<FormularioDeCliente> {
  String _errorMessage = '';

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cargoController = TextEditingController();
  TextEditingController _ruaController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _numeroController = TextEditingController();


  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de cliente')),
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
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Informe o nome!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  hintText: '000.000.000-00'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                validator: (value){
                  if(value!.isEmpty) {
                    return 'Informe o cpf!';
                  }


                  if (value.length < 11) {
                    return 'Digite o CPF no formato certo';
                  }

                },
                maxLength: 14,
                keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (val){
                validateEmail(val);
              },
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Informe o email!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_errorMessage, style: TextStyle(color: Colors.red),),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: _cargoController,
              decoration: InputDecoration(labelText: 'Cargo'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Informe o cargo!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: _ruaController,
              decoration: InputDecoration(labelText: 'Rua'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Informe o rua!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: _bairroController,
              decoration: InputDecoration(labelText: 'Bairro'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Informe o bairro!';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: _numeroController,
              decoration: InputDecoration(labelText: 'Número'),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Informe o número!';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _cadastrar(context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: ElevatedButton(
        child: Text('Cadastrar'),
        onPressed: () {
          if(_formkey.currentState!.validate()) {
          debugPrint('CADASTROU...');
          String cpfDoCliente = _cpfController.text;
          String nomeDoCliente = _nomeController.text;
          String email = _emailController.text;
          String cargo = _cargoController.text;
          String rua = _ruaController.text;
          String bairro = _bairroController.text;
          String numero = _numeroController.text;


          Cliente novoCliente = Cliente(nomeDoCliente, cpfDoCliente, email, cargo, rua, bairro, numero);

          ListaDeClientes listaClientes = Provider.of<ListaDeClientes>(
              context, listen: false);
          listaClientes.adicionaCliente(novoCliente);

          Navigator.pop(context);
          }
        },
      ),
    );
  }


  void validateEmail(String val) {
    if(val.isEmpty){
      setState(() {
        _errorMessage = "Email não pode estar vazio";
      });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Email inválido";
      });
    }else{
      setState(() {

        _errorMessage = "";
      });
    }
  }
}