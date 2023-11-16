import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Widget com o campo de texto do formulário, para ser reutilizado em outras telas

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String titleText;
  final bool obscureText;
  final IconData icons;

  const CustomTextFormField({
    super.key,
    required this.titleText,
    this.obscureText = false,
    required this.icons,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 3),
        TextFormField(
          maxLength: 20,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: Icon(icons, color: Colors.black),
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
