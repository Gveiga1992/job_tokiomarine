import 'package:job_vitoria_desafio/data/models/user_model.dart';
import 'package:job_vitoria_desafio/data/providers/user_login_provider.dart';

class LoginRepository {
  final LoginAPIProviderFirebase apiClient = LoginAPIProviderFirebase();

  Future<UserSignUpModel?> createUserWithEmailAndPassword(
      String email, String pass, String name) {
    return apiClient.createUserWithEmailAndPassword(email, pass, name);
  }

  Future<UserSignUpModel?> signWithEmailAndPass(String email, String pass) {
    return apiClient.signWithEmailAndPass(email, pass);
  }

  signinOut() {
    return apiClient.signinOut();
  }
}
