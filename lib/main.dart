import 'package:easycharge/screens/cliente/cliente_lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(EasychargeApp());

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: ListaDeClientes(),
        ),
        theme: ThemeData(
            fontFamily: 'NotoSans',
            primaryColor: Colors.black54,
            appBarTheme: const AppBarTheme(color: Colors.black54)
        )
    );
  }
}
