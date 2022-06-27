import 'package:easycharge/screens/cliente/listagem.dart';
import 'package:flutter/material.dart';

void main() => runApp(EasychargeApp());

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
