import 'package:brasil_fields/brasil_fields.dart';
import 'package:easycharge/screens/autenticacao/registrar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../components/mensagem.dart';
import '../dashboard.dart';

class Login extends StatelessWidget {

  final TextEditingController _cpfControlador = TextEditingController();
  final TextEditingController _senhaControlador = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 150),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child:
                      Image.asset('assets/images/easycharge.png', width: 280)),
              SizedBox(
                height: 130,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  height: 430,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: _construindoFormulario(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }

  Widget _construindoFormulario(context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Faça seu Login',
            style: TextStyle(
              color: Color.fromRGBO(27, 200, 200, 1.0),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1),
          TextFormField(
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Color.fromRGBO(27, 200, 200, 1.0),
                fontWeight: FontWeight.bold,
              ),
              labelText: 'CPF',
            ),
            maxLength: 14,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
            validator: (value) {
              if (value.length == 0) return 'Informe o CPF !';

              if (value.length < 14) return 'CPF invalido !';

              return null;
            },
            keyboardType: TextInputType.number,
            controller: _cpfControlador,
          ),
          SizedBox(height: 20),
          TextFormField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                    color: Color.fromRGBO(27, 200, 200, 1.0),
                    fontWeight: FontWeight.bold),
                labelText: 'Senha',
              ),
              maxLength: 15,
              validator: (value) {
                if (value.length == 0) return 'Digite a Senha !';

                return null;
              },
              keyboardType: TextInputType.text,
              controller: _senhaControlador),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  if (_cpfControlador.text == '111.111.111-11' &&
                      _senhaControlador.text == 'abc456') {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                      (route) => false,
                    );
                  } else {
                    exibirAlerta(
                        context: context,
                        titulo: 'ATENÇÂO',
                        content: 'CPF ou Senha incorretos !');
                  }
                }
              },
              child: const Text(
                'CONTINUAR',
                style: TextStyle(
                  color: Color.fromRGBO(27, 200, 200, 1.0),
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 2,
                  color: Color.fromRGBO(27, 200, 200, 1.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Esqueci minha senha ',
            style: TextStyle(
                color: Color.fromRGBO(27, 200, 200, 1),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 25),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Registrar(),
                ),
              );
            },
            child: Text(
              'Criar uma Conta',
              style: TextStyle(
                color: Color.fromRGBO(27, 200, 200, 1.0),
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                width: 2,
                color: Color.fromRGBO(27, 200, 200, 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
