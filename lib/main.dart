import 'package:easycharge/state/lista_clientes_state.dart';
import 'package:easycharge/screens/cliente/listagem_clientes.dart';
import 'package:easycharge/state/wizard_cadastro_de_clientes_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => ListaDeClientesState()
      ),
      ChangeNotifierProvider(
        create: (context) => WizardCadastroDeClienteState(),
      ),
    ], child: EasychargeApp()));

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ListagemClientes(),
        theme: ThemeData(
            fontFamily: 'NotoSans',
            primaryColor: Colors.black54,
            appBarTheme: const AppBarTheme(color: Colors.black54)));
  }
}
