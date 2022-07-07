import 'package:easycharge/screens/dashboard.dart';
import 'package:easycharge/state/listaDividas.dart';
import 'package:easycharge/state/wizard_cadastro_cliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'http/webclient.dart';
import 'state/listaClientes.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ListaDeClientes()
        ),
        ChangeNotifierProvider(
            create: (context) => ListaDeDividas()
        ),
        ChangeNotifierProvider(
            create: (context) => WizardCadastroDeClienteState()
        ),
      ],
      child: EasychargeApp()
  ));
  findAll();
}

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[900],
          appBarTheme: AppBarTheme(color:Colors.purple[900]),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.purple[700],
            textTheme: ButtonTextTheme.primary,
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple[700])
      ),
      home: Dashboard(),
    );
  }
}

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       if(index == 0){
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             return ListagemDeClientes();
//           }));
//       }
//       if(index == 1){
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             return ListagemDeDividas();
//           }));
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('EasyCharge'),
//       ),
//
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.people),
//             label: 'Cliente',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.monetization_on),
//             label: 'Divida',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'Cobrança',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.grey[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }




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
