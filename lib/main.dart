import 'package:easycharge/screens/cliente/formulario.dart';
import 'package:easycharge/screens/cliente/listagem.dart';
import 'package:easycharge/screens/divida/formulario.dart';
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
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Cliente',
      style: optionStyle,
    ),
    Text(
      'Index 1: Divida',
      style: optionStyle,
    ),
    Text(
      'Index 2: Cobrança',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyCharge'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Cliente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Divida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Cobrança',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
