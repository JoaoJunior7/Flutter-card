import 'package:card_flutter/app/pages/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validatorless/validatorless.dart';
import 'package:card_flutter/app/models/user_auth.dart';
import 'package:card_flutter/app/repository/auth_repository.dart';

import '../widgets/custom_text_button.dart';
part '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background da tela de login
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E4E62), Color(0xFF2D958E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        //Widget com Scroll da tela de login, para se adaptar a qualquer tamanho de tela
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 170.h,
                  ),
                  // Widget com o formulário de login
                  const _LoginForm(),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
            // Widget para deixar o botão de Política de privacidade fixo na parte inferior da tela
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomTextButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
