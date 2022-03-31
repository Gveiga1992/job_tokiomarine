import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_vitoria_desafio/data/models/user_model.dart';

class LoginAPIProviderFirebase {
  FirebaseAuth auth = FirebaseAuth.instance;

  //RETORNAR USUARIO
  Stream<UserSignUpModel> get onAuthStateChanged => auth
      .authStateChanges()
      .map((event) => UserSignUpModel.fromSnapshot(event));

  //CRIAR USUARIO
  Future<UserSignUpModel?> createUserWithEmailAndPassword(
      String email, String pass, String name) async {
    try {
      final currentUser = (await auth.createUserWithEmailAndPassword(
              email: email, password: pass))
          .user;

      await FirebaseAuth.instance.currentUser!
          .updateProfile(displayName: currentUser!.displayName);

      await FirebaseAuth.instance.currentUser!.reload();
      return UserSignUpModel.fromSnapshot(currentUser);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserSignUpModel?> signWithEmailAndPass(
      String email, String pass) async {
    try {
      final currentUser =
          (await auth.signInWithEmailAndPassword(email: email, password: pass))
              .user;
      return UserSignUpModel.fromSnapshot(currentUser);
    } catch (e) {
      print(e);
      return null;
    }
  }


  signinOut() async {
    return auth.signOut();
  }
}
