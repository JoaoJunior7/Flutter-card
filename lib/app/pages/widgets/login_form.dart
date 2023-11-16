part of '../login/login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthRepository _authRepository = AuthRepository();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          // Widget com o campo de texto do formulário de usuário
          child: CustomTextFormField(
            titleText: 'Usuário',
            icons: Icons.person_sharp,
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Usuário obrigatório'),
              Validatorless.max(20, '20 caracteres no máximo'),
              Validatorless.regex(RegExp(r'^.*[^\s]$'),
                  'O campo não pode terminar com espaços'),
            ]),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          // Widget com o campo de texto do formulário de senha
          child: CustomTextFormField(
            titleText: 'Senha',
            obscureText: true,
            icons: Icons.lock,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatório'),
              Validatorless.min(2, '2 caracteres no mínimo'),
              Validatorless.max(20, '20 caracteres no máximo'),
              Validatorless.regex(RegExp(r'^.*[^\s]$'),
                  'O campo não pode terminar com espaços'),
              Validatorless.regex(RegExp(r'^[a-zA-Z0-9]+$'),
                  'A senha não pode conter caracteres especiais'),
            ]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // Widget com o botão de login
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF44BD6E)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 16, horizontal: 70),
            ),
          ),
          onPressed: () async {
            final formValid = _formKey.currentState?.validate() ?? false;
            if (formValid) {
              final UserAuth? userAuth =
                  await _authRepository.signInWithEmailAndPassword(
                email: _loginEC.text,
                password: _passwordEC.text,
              );
              if (userAuth != null) {
                if (!context.mounted) return;
                Navigator.of(context).pushNamed('/card_page');
              } else {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('E-mail ou senha inválidos'),
                  ),
                );
              }
            }
          },
          child: const Text(
            'Entrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ]),
    );
  }
}
