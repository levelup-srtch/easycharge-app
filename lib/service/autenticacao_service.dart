import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoService {

  static const String REGISTRO_AUTENTICACAO = 'REGISTRO_AUTENTICACAO';

  static Future<bool> isAutenticacaoSalva() async {
    var preferencias = await SharedPreferences.getInstance();

    var registroSalvo = preferencias.getBool(REGISTRO_AUTENTICACAO);
    return registroSalvo != null && registroSalvo;
  }

  static Future<void> registraAutenticacao() async {
    var preferencias = await SharedPreferences.getInstance();
    preferencias.setBool(REGISTRO_AUTENTICACAO, true);
  }

  static Future<void> limpaAutenticacao() async {
    var preferencias = await SharedPreferences.getInstance();
    preferencias.remove(REGISTRO_AUTENTICACAO);
  }

}