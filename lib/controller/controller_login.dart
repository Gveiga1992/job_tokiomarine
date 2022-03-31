import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:job_vitoria_desafio/data/models/user_model.dart';
import 'package:job_vitoria_desafio/data/repository/user_login_repository.dart';
import 'package:job_vitoria_desafio/routes/app_routes.dart';
import 'package:job_vitoria_desafio/theme/projetct_colors.dart';

class LoginController extends GetxController {
  final size = MediaQuery.of(Get.context!).size;
  final LoginRepository repository = LoginRepository();

  RxBool valorSetado = false.obs;
  RxBool showLogin = true.obs;

  TextEditingController cpfField = TextEditingController();
  TextEditingController passField = TextEditingController();

  TextEditingController nameFieldSignUp = TextEditingController();
  TextEditingController cpfFieldSignUp = TextEditingController();
  TextEditingController emailFieldSignUp = TextEditingController();
  TextEditingController passFieldSignUp = TextEditingController();

  GlobalKey<FormState> formValidate = GlobalKey<FormState>();
  GlobalKey<FormState> formValidateRegister = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldValidate = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldValidateRegister =
      GlobalKey<ScaffoldState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  void register() async {
    if (formValidateRegister.currentState!.validate()) {
      showDialog("Criando usuário, aguarde!");
      UserSignUpModel? user = await repository.createUserWithEmailAndPassword(
          emailFieldSignUp.text, passFieldSignUp.text, nameFieldSignUp.text);

      if (user != null) {
        createUserOnDataBase(
                user.id, cpfFieldSignUp.text, user.email, nameFieldSignUp.text)
            .whenComplete(() {
          emailFieldSignUp.clear();
          passFieldSignUp.clear();
          nameFieldSignUp.clear();
          cpfFieldSignUp.clear();
          showLogin.value = true;
          Get.back();
          scaffoldValidateRegister.currentState?.showSnackBar(
              SnackBar(content: Text("Usuário criado com sucesso!")));
          checkAuthenticUser();
        });
      }
    } else {
      Get.back();
    }
  }

  void login(checkUserFromDataReceived) async {
    showDialog("Realizando login");
    if (formValidate.currentState!.validate()) {
      DocumentSnapshot consulta = await db
          .collection("infosAbout")
          .doc(checkUserFromDataReceived)
          .get();

      if (consulta.exists) {
        repository
            .signWithEmailAndPass(consulta['userEmail'], passField.text)
            .then((value) {
          Get.back();
          checkAuthenticUser();
        });
      } else {
        Get.back();
        scaffoldValidate.currentState
            ?.showSnackBar(SnackBar(content: Text("Este usuário não existe!")));
      }
    } else {
      Get.back();
    }
  }

  Future createUserOnDataBase(userUID, userCpfCnpj, userEmail, userName) async {
    await db.collection("infosAbout").doc(userCpfCnpj).set({
      "userId": userUID,
      "userIdentification": userCpfCnpj,
      "userEmail": userEmail,
      "userName": userName
    });
  }

  checkAuthenticUser() {
    User? usuario = auth.currentUser;
    if (usuario != null) {
      showDialog("Sincronizando").then((value) {
        Future.delayed(Duration(seconds: 5), () async {
          Get.offAllNamed(
            Routes.HOME,
          );
        });
      });
    } else {
      showDialog("Sincronizando").then((value) {
        Future.delayed(Duration(seconds: 5), () async {
          Get.back();
        });
      });
    }
  }

  Future showDialog(texto) async {
    Get.defaultDialog(
        barrierDismissible: false,
        backgroundColor: ProjectColors.firstColor,
        title: "",
        titleStyle: TextStyle(color: Colors.transparent),
        content: Container(
            color: ProjectColors.firstColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitCubeGrid(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? ProjectColors.secondColor
                            : ProjectColors.thirdColorToGradient,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        texto,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
            width: (size.width / 100) * 80,
            height: (size.height / 100) * 20));
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    checkAuthenticUser();
  }

}
