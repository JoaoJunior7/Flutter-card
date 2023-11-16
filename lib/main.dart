import 'package:card_flutter/app/pages/card_page/card_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/pages/login/login_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Inicializa o ScreenUtil para que o layout se adapte a qualquer tamanho de tela
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) => MaterialApp(
        title: 'Flutter Card',
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        theme: ThemeData(
          useMaterial3: true,
        ),
        // Rotas nomeadas
        routes: {
          '/home': (_) => const LoginPage(),
          '/card_page':(_) => const CardPage(),
        },
      )     
    );
  }
}
