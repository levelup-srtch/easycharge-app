import 'package:flutter/material.dart';

import './title.dart';
import '../../screens/cliente/listagem_clientes.dart';
import '../../screens/divida/listagem_dividas.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black38, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Stack(
          children: <Widget>[
            _buildDrawerBack(),
            ListView(
              padding: const EdgeInsets.only(left: 32.0),
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                  height: 170.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: -9.7,
                          top: 35.0,
                          child: IconButton(
                            alignment: Alignment.centerLeft,
                            icon: const Icon(Icons.arrow_back_rounded),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.white,
                          )),
                      const Positioned(
                          left: 35.0,
                          top: 45.0,
                          child: Text(
                            'Opções',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      const Positioned(
                          left: 0.0,
                          bottom: 0.0,
                          child: Text(
                            'Olá, Caio',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
                const Divider(),
                DrawerTitle(
                  icon: Icons.person_outline_outlined,
                  text: 'Clientes',
                  page: ListagemClientes(),
                ),
                DrawerTitle(
                  icon: Icons.account_balance_outlined,
                  text: 'Dividas',
                  page: ListaDeDividas(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
