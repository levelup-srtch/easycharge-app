import 'package:easycharge/screens/cliente/listagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/listaClientes.dart';

void main() => runApp(ChangeNotifierProvider(
  child: EasychargeApp(),
  create: (context) => ListaDeClientes(),
));

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
