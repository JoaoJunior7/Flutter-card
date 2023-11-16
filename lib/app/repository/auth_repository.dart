import 'package:card_flutter/app/models/user_auth.dart';
import 'package:card_flutter/app/services/firebase_auth_service.dart';

// Lidar com a lógica de negócios da autenticação do usuário

class AuthRepository {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  
  Future<UserAuth?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _firebaseAuthService.signInWithEmailAndPassword(
      email,  
      password, 
    );
  }
}
