import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:card_flutter/app/models/user_auth.dart';

// Serviço para lidar com a autenticação do Firebase

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserAuth?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      return user != null ? UserAuth(email: user.email!, senha: password) : null;
    } catch (e) {
      log('error', error: e);
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}