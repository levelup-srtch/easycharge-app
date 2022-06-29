import 'package:easycharge/models/lista_clientes.dart';
import 'package:easycharge/screens/cliente/listagem_clientes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    child: EasychargeApp(),
    create: (context) => ListaDeClientes()));

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ListagemClientes(),
        theme: ThemeData(
            fontFamily: 'NotoSans',
            primaryColor: Colors.black54,
            appBarTheme: const AppBarTheme(color: Colors.black54)
        )
    );
  }
}
