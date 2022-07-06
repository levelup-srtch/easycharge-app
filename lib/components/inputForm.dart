import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class FormInput extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLenght;
  final List<TextInputFormatter> formatters;
  final TextInputType keyboardType;
  String? Function(String?)? valid;

  FormInput({super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.maxLenght,
    required this.formatters,
    required this.keyboardType,
    this.valid
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
          ),
          maxLength: maxLenght,
          inputFormatters: formatters,
          validator: valid,
          keyboardType: keyboardType,
        ),
    );
  }
}
