import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  FirebaseFirestore fb = FirebaseFirestore.instance;

  //IMAGEM LARISSA E ALICE - FROM FIREBASE
  RxString urlUm = "".obs;
  RxString urlDois = "".obs;

  //IMAGEM USUARIO LOGADO - FROM FIREBASE
  RxString urlDrawerProfile = "".obs;

  //IMAGEM CARDS CONTRATADOS - FROM FIREBASE
  RxString urlCardProfileUm = "".obs;
  RxString urlCardProfileDois = "".obs;
  RxString urlCardProfileTres = "".obs;

  //NOME USUÁRIO LOGADO - FROM FIREBASE
  RxString userName = "".obs;

  recuperarFotos() {
    fb.collection("imagens").doc("fotos").get().then((value) {
      urlUm.value = value['urlUm'];
      urlDois.value = value['urlDois'];

      urlCardProfileUm.value = value['cardUm'];
      urlCardProfileDois.value = value['cardDois'];
      urlCardProfileTres.value = value['cardTres'];

      urlDrawerProfile.value = value['drawerProfile'];
    });
    User? logado = FirebaseAuth.instance.currentUser;
    fb
        .collection("infosAbout")
        .where("userId", isEqualTo: logado!.uid)
        .get()
        .then((value) {
      value.docs.map((e) {
        userName.value = e['userName'];
      }).toList();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    recuperarFotos();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
}
