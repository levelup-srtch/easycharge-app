// import 'package:brasil_fields/brasil_fields.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
//
// import '../../models/funcionarios/funcionario.dart';
// import '../dashboard.dart';
//
// class Registrar extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nomeController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _cpfController = TextEditingController();
//   final TextEditingController _celularController = TextEditingController();
//   final TextEditingController _cargoController = TextEditingController();
//   final TextEditingController _statusController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cadastro de Funcionário'),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Nome Completo',
//                   ),
//                   controller: _nomeController,
//                   maxLength: 255,
//                   keyboardType: TextInputType.text,
//                   validator: (value) {
//
//                     if (!value(" "))
//                       return 'Informe pelo menos um sobrenome!';
//
//                     if (value.isEmpty)
//                       return 'Campo Obrigatório';
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                   ),
//                   controller: _emailController,
//                   maxLength: 50,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (!value.contains("@") || !value.contains('.'))
//                       return 'Email inválido!';
//
//                     if (value.isEmpty) return 'Email muito curto!';
//
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'CPF',
//                   ),
//                   controller: _cpfController,
//                   maxLength: 14,
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value.length != 14)
//                       return 'CPF inválido';
//
//                     if (value.isEmpty)
//                       return 'Campo Obrigatório';
//
//                     return null;
//                   },
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     CpfInputFormatter()
//                   ],
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Celular',
//                   ),
//                   controller: _celularController,
//                   maxLength: 15,
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value.length < 12)
//                       return 'Celular inválido';
//
//                     if (value.isEmpty)
//                       return 'Campo Obrigatório';
//
//                     return null;
//                   },
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     TelefoneInputFormatter()
//                   ],
//                 ),
//                 DropdownButtonFormField(
//                   isExpanded: true,
//                   decoration: InputDecoration(labelText: 'Status'),
//                   items: ['ATIVO', 'SUSPENSO'].map((String status) {
//                     return DropdownMenuItem(
//                       child: Text(status),
//                       value: status,
//                     );
//                   }).toList(),
//                   onChanged: (String ) {
//                     _statusController.text ;
//                   },
//                   validator: (value) {
//                     if (value == null)
//                       return 'Selecione um estado!';
//
//                     return null;
//                   },
//                 ),
//                 DropdownButtonFormField(
//                   isExpanded: true,
//                   decoration: InputDecoration(labelText: 'Cargo'),
//                   items: ['Senior', 'Pleno', 'Junior', 'Estagiário ']
//                       .map((String cargo) {
//                     return DropdownMenuItem(
//                       child: Text(cargo),
//                       value: cargo,
//                     );
//                   }).toList(),
//                   onChanged: (String ) {
//                     _cargoController.text ;
//                   },
//                   validator: (value) {
//                     if (value == null)
//                       return 'Selecione um estado!';
//
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 40),
//                 OutlinedButton(
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       _salvar(context);
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Dashboard(),
//                           ),
//                           (route) => false);
//                     }
//                   },
//                   child: Text(
//                     'Finalizar Cadastro',
//                     style: TextStyle(
//                       color: Color.fromRGBO(27, 200, 200, 1.0),
//                     ),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(
//                       width: 2,
//                       color: Color.fromRGBO(27, 200, 200, 1.5),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _salvar(context) {
//     Provider.of<Funcionario>(context).nome = _nomeController.text;
//   }
// }
