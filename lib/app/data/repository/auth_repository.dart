import 'package:login_firebase/app/data/model/user_model.dart';
import 'package:login_firebase/app/data/provider/auth_provider.dart';

class AuthRepository {
  // final LoginProvider provider = LoginProvider();
  final AuthProvider provider;

  AuthRepository({required this.provider});

  Future<UserModel?> createUserModelWithEmailAndPassword(
      String email, String password, String name) {
    return provider.createUserModelWithEmailAndPassword(email, password, name);
  }

  Future<UserModel?> signInWithEmailAndPassword(String email, String password) {
    return provider.signInWithEmailAndPassword(email, password);
  }

  signOut() {
    provider.signOut();
  }
}
