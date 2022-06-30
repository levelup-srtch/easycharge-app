import 'package:easycharge/screens/autenticacao/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(EasychargeApp());

class EasychargeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(95,158,160,1),
          accentColor: Color.fromRGBO(32,92,92,1),
          appBarTheme: AppBarTheme(color:Color.fromRGBO(52,82,82,1)),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(102,205,170,1))
      ),
      home:Login(),
    );
  }
}
