import 'package:flutter/material.dart';

import 'autenticacao/login.dart';
import 'cliente/listaClientes.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(95, 158, 160, 1),
            ),
            child: Text(
              'Easycharge',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Clientes'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaClientes(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Dividas'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaClientes(),
                ),
                (route) => false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_outlined),
            title: Text('Cobranças'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaClientes(),
                ),
                    (route) => false,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
