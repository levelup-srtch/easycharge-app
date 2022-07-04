import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/funcionarios/funcionario.dart';
import 'autenticacao/login.dart';
import 'cliente/listaClientes.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Easycharge'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(child: Image.asset('assets/images/logo.jpg')),
          ),
          Row(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ListaClientes(),
                        ),
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 100,
                        width: 150,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.people, color: Colors.white, size: 26),
                              Text(
                                'Cliente',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ])),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 160),
                child: Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 100,
                        width: 150,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(Icons.logout, color: Colors.white, size: 26),
                              Text(
                                'Sair',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ])),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      // backgroundColor: Color.fromRGBO(32,92,92,1),
    );
  }
}
