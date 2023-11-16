import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:card_flutter/app/pages/card_page/card_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validatorless/validatorless.dart';

import '../../models/card_info.dart';
import '../widgets/custom_text_button.dart';
part '../widgets/custom_card.dart';


class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background da tela de Card_page
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E4E62), Color(0xFF2D958E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        //Widget com Scroll da tela de Card_page, para se adaptar a qualquer tamanho de tela
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              SizedBox(height: 75.h),
              // Widget com o card personalizado e as funçõoes de adicionar, editar e remover cards
              const _CustomCard(),
              const SizedBox(height: 50),
            ])),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                // Widget com o botão de Política de privacidade
                child: CustomTextButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



