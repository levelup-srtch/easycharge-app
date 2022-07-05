import 'package:easycharge/components/loading.dart';
import 'package:easycharge/screens/autenticacao/formulario_login.dart';
import 'package:easycharge/service/autenticacao_service.dart';
import 'package:easycharge/state/lista_clientes.dart';
import 'package:easycharge/screens/cliente/listagem.dart';
import 'package:easycharge/state/wizard_cadastro_cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(
      MultiProvider(
        child: EasychargeApp(),
        providers: [
          ChangeNotifierProvider(
            create: (context) => ListaDeClientesState(),
          ),
          ChangeNotifierProvider(
            create: (context) => WizardCadastroDeClienteState(),
          ),
        ],
      ),
    );

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: Future.delayed(Duration(seconds: 2)).then((v) => AutenticacaoService.isAutenticacaoSalva()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var jahAutenticou = snapshot.requireData;
            if (jahAutenticou) {
              return ListagemDeClientes();
            }

            return FormularioDeLogin();
          }

          return Loading();
        },
      ),
    );
  }
}



/*
<easycharge>
  <material-app>
    <scaffold>
      <app-bar>
        ....
      </app-bar>
      <body>
        ...
        <input type="text">
      </body>
    </scaffold>
  </material-app>
</easycharge>
 */
