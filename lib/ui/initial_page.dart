import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:job_vitoria_desafio/theme/projetct_colors.dart';
import 'package:job_vitoria_desafio/widgets/custom_buttom.dart';

import '../controller/controller_login.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  LoginController pageViewController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() => Scaffold(
          key: pageViewController.showLogin.value == true
              ? pageViewController.scaffoldValidate
              : pageViewController.scaffoldValidateRegister,
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ProjectColors.secondColor,
                ProjectColors.thirdColorToGradient
              ],
            )),
            width: (size.width / 100) * 100,
            height: (size.height / 100) * 100,
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: (size.height / 100) * 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Bem vindo!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Aqui você gerencia seus seguros e de seus familiares em poucos cliques!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      elevation: 0,
                                      padding: EdgeInsets.all(8),
                                      primary: Colors.transparent),
                                  onPressed: () {
                                    pageViewController.showLogin.value = true;
                                  },
                                  child: const Text("Entrar")),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      elevation: 0,
                                      padding: EdgeInsets.all(8),
                                      primary: Colors.transparent),
                                  onPressed: () {
                                    pageViewController.showLogin.value = false;
                                  },
                                  child: Text("Cadastrar")),
                            ],
                          ),
                          pageViewController.showLogin.value == true
                              ? Column(
                                  children: [
                                    SizedBox(
                                      width: (size.width / 100) * 80,
                                      height: (size.height / 100) * 10,
                                      child: TextFormField(
                                        maxLength: 14,
                                        controller: pageViewController.cpfField,
                                        validator: (checkCPF){
                                          if (checkCPF!.length == 14) {
                                            if (!CNPJValidator.isValid(
                                                checkCPF)) {
                                              return "CNPJ inválido";
                                            }
                                          } else if (checkCPF.length == 11) {
                                            if (!CPFValidator.isValid(
                                                checkCPF)) {
                                              return "CPF inválido";
                                            }
                                          } else if (checkCPF.isEmpty) {
                                            return "CPF em branco ou inválido";
                                          }
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                        cursorColor: Colors.grey,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "CPF/CNPJ",
                                          counterStyle: TextStyle(
                                              color: ProjectColors.firstColor),
                                          isDense: true,
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(5)),
                                    SizedBox(
                                      width: (size.width / 100) * 80,
                                      height: (size.height / 100) * 7,
                                      child: TextFormField(
                                        controller:
                                            pageViewController.passField,
                                        textAlign: TextAlign.center,
                                        validator: (checkPassword) {
                                          if (checkPassword!.isEmpty) {
                                            return "Senha em branco ou inválida ";
                                          } else if (checkPassword.length < 6) {
                                            return 'A senha precisa conter no mínimo 6 dígitos';
                                          }
                                        },
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                        cursorColor: Colors.grey,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: "*****",
                                          isDense: true,
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Insira o CPF/CNPJ do titular da conta",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    SizedBox(
                                      width: (size.width / 100) * 80,
                                      height: (size.height / 100) * 10,
                                      child: TextFormField(
                                        maxLength: 14,
                                        controller:
                                            pageViewController.cpfFieldSignUp,
                                        validator: (checkCPF) {
                                          if (checkCPF!.length == 14) {
                                            if (!CNPJValidator.isValid(
                                                checkCPF)) {
                                              return "CNPJ inválido";
                                            }
                                          } else if (checkCPF.length == 11) {
                                            if (!CPFValidator.isValid(
                                                checkCPF)) {
                                              return "CPF inválido";
                                            }
                                          } else if (checkCPF.isEmpty) {
                                            return "Campo em branco";
                                          }
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                        cursorColor: Colors.grey,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: "CPF/CNPJ",
                                          isDense: true,
                                          counterStyle: TextStyle(
                                              color: ProjectColors.firstColor),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    SizedBox(
                                      width: (size.width / 100) * 80,
                                      height: (size.height / 100) * 7,
                                      child: TextFormField(
                                        controller:
                                            pageViewController.nameFieldSignUp,
                                        validator: (checkName) {
                                          if (checkName!.isEmpty) {
                                            return "Nome inválido";
                                          }
                                        },
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                        cursorColor: Colors.grey,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          hintText: "Nome",
                                          isDense: true,
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    SizedBox(
                                      width: (size.width / 100) * 80,
                                      height: (size.height / 100) * 7,
                                      child: TextFormField(
                                        controller:
                                            pageViewController.emailFieldSignUp,
                                        validator: (checkEmail) {
                                          if (checkEmail!.isEmpty ||
                                              !checkEmail.contains("@")) {
                                            return "E-mail inválido";
                                          } else if (!GetUtils.isEmail(
                                              checkEmail)) {
                                            return "Campo requer um e-mail válido";
                                          }
                                        },
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                        cursorColor: Colors.grey,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: "E-mail",
                                          isDense: true,
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    SizedBox(
                                      width: (size.width / 100) * 80,
                                      height: (size.height / 100) * 7,
                                      child: TextFormField(
                                        controller:
                                            pageViewController.passFieldSignUp,
                                        validator: (checkPass) {
                                          if (checkPass!.isEmpty) {
                                            return 'Senha em branco';
                                          } else if (checkPass.length < 6) {
                                            return 'A senha precisa conter no mínimo 6 dígitos';
                                          }
                                        },
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                        cursorColor: Colors.grey,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                          hintText: "Senha",
                                          isDense: true,
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.0)),
                                            borderSide: BorderSide(
                                                color: (Colors.white),
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          pageViewController.showLogin.value == true
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          fillColor: MaterialStateProperty.all(
                                              ProjectColors.secondColor),
                                          value: pageViewController
                                              .valorSetado.value,
                                          shape: CircleBorder(),
                                          onChanged: (bool? value) {
                                            pageViewController
                                                .valorSetado.value = value!;
                                          },
                                        ),
                                        Text(
                                          "Lembrar Sempre",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Esqueceu a senha?",
                                              style: TextStyle(
                                                  color:
                                                      ProjectColors.secondColor,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        pageViewController.login(
                                            pageViewController.cpfField.text);
                                      },
                                      child: CustomHomeButtom(
                                        iconData: FontAwesomeIcons.arrowRight,
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.all(8)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ao pressionar o botão voce aceita nosso",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "termos e condições",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color:
                                                      ProjectColors.secondColor,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    GestureDetector(
                                      onTap: () {
                                        pageViewController.register();
                                      },
                                      child: CustomHomeButtom(
                                        iconData: FontAwesomeIcons.arrowRight,
                                      ),
                                    )
                                  ],
                                ),
                        ],
                      ),
                      key: pageViewController.showLogin.value == true
                          ? pageViewController.formValidate
                          : pageViewController.formValidateRegister,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: ProjectColors.firstColor,
                        borderRadius: BorderRadius.circular(15)),
                    width: (size.width / 100) * 80,
                    height: pageViewController.showLogin.value == true
                        ? (size.height / 100) * 60
                        : (size.height / 100) * 80,
                  ),
                ],
              ),
            )),
          ),
        ));
  }
}
