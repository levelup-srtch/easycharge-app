import 'package:easycharge/screens/dashboard.dart';
import 'package:easycharge/state/wizard_cadastro_cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/clientes/listaClientes.dart';
import 'models/clientes/listaEndereco.dart';
import 'models/funcionarios/listaFuncionario.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListaDeFuncionarios()),
        ChangeNotifierProvider(create: (context) => ListaDeClientes()),
        ChangeNotifierProvider(create: (context) => ListaEndereco()),
        ChangeNotifierProvider(
            create: (context) => WizardCadastroDeClienteState()
        ),
      ],
      child: EasychargeApp(),
    ));

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(95, 158, 160, 1),
          accentColor: Color.fromRGBO(32, 92, 92, 1),
          appBarTheme: AppBarTheme(color: Color.fromRGBO(52, 82, 82, 1)),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
          // drawerTheme: DrawerThemeData(
          //   backgroundColor: Color.fromRGBO(171, 229, 230, 1.0)
          // ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Color.fromRGBO(102, 205, 170, 1))),

      home: Dashboard(),
    );
  }
}
