import 'package:easycharge/state/lista_clientes.dart';
import 'package:easycharge/screens/cliente/listagem.dart';
import 'package:easycharge/state/wizard_cadastro_cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      home: ListagemDeClientes(),
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
