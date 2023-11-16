import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Widget com o botão de Política de privacidade, para ser reutilizado em outras telas

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _abrirUrl,
      child: const Text(
        'Política de privacidade',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  _abrirUrl() async {
    final Uri url = Uri.parse('http://google.com.br');
    if (!await launchUrl(url)) {
      throw Exception('Não é possível acessar o $url');
    }
  }
}
