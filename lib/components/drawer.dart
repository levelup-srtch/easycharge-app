import 'package:easycharge/components/title.dart';
import 'package:easycharge/screens/cliente/listagem.dart';
import 'package:easycharge/screens/divida/formulario.dart';
import 'package:easycharge/screens/divida/listagem.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
@override
Widget build(BuildContext context) {
  Widget _buildDrawerBack() => Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
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
                          icon: const Icon(Icons.keyboard_arrow_left_rounded),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.grey,
                        )),
                    const Positioned(
                        left: 35.0,
                        top: 45.0,
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )),
                  ],
                ),
              ),
              DrawerTitle(
                icon: Icons.people_outline_outlined,
                text: 'Clientes',
                page: ListagemDeClientes(),
              ),
              DrawerTitle(
                icon: Icons.monetization_on_outlined,
                text: 'Dividas',
                page: ListagemDeDividas(),
              )
            ],
          )
        ],
      ),
    ),
  );
}
}

