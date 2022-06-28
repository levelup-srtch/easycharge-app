import 'package:easycharge/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(EasychargeApp());

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueGrey[900], appBarTheme: AppBarTheme(color:Colors.blueGrey[900]),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.grey[700],
            textTheme: ButtonTextTheme.primary,
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey[700])
      ),
      home:Dashboard(),
    );
  }
}
