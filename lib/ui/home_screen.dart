import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:job_vitoria_desafio/theme/projetct_colors.dart';
import 'package:job_vitoria_desafio/ui/web_view_screen.dart';
import 'package:job_vitoria_desafio/widgets/custom_card.dart';
import '../controller/controller_home.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_item_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController home = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(()=> Scaffold(
      backgroundColor: ProjectColors.someThings,
      drawer: Drawer(
          backgroundColor: ProjectColors.firstColor,
          child: ListView(
            children: [
              Container(
                color: Colors.transparent,
                child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CircleAvatar(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                NetworkImage(home.urlDrawerProfile.value),
                              ),
                              SizedBox(
                                width: 15,
                                height: 15,
                                child: FloatingActionButton(
                                  onPressed: () {},
                                  foregroundColor:
                                  ProjectColors.thirdColorToGradient,
                                  mini: true,
                                  backgroundColor: ProjectColors.secondColor,
                                  child: FaIcon(
                                    FontAwesomeIcons.camera,
                                    size: 8,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Olá,",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              Obx(
                                    () => Text(
                                  home.userName.value.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Minha conta  ",
                                    style: TextStyle(
                                        color: ProjectColors.secondColor,
                                        fontSize: 12),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.angleDown,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomItemBar(
                itemBarName: 'Home/Cotar Seguro',
                itemData: FaIcon(
                  FontAwesomeIcons.list,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Minhas Contratações',
                itemData: FaIcon(
                  FontAwesomeIcons.shield,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Meus Sinistros',
                itemData: FaIcon(
                  FontAwesomeIcons.circleExclamation,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Minhas Família',
                itemData: FaIcon(
                  FontAwesomeIcons.userGroup,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Meus Bens',
                itemData: FaIcon(
                  FontAwesomeIcons.car,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Pagamentos',
                itemData: FaIcon(
                  FontAwesomeIcons.wallet,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Corretores',
                itemData: FaIcon(
                  FontAwesomeIcons.userTie,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Validar Boleto',
                itemData: FaIcon(
                  FontAwesomeIcons.ticket,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Telefones Importantes',
                itemData: FaIcon(
                  FontAwesomeIcons.phone,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Indique e Ganhe',
                itemData: FaIcon(
                  FontAwesomeIcons.moneyCheck,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              CustomItemBar(
                itemBarName: 'Configurações',
                itemData: FaIcon(
                  FontAwesomeIcons.gear,
                  size: 13,
                  color: ProjectColors.secondColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Sair",
                      style: TextStyle(
                          color: ProjectColors.secondColor, fontSize: 13),
                    )
                  ],
                ),
              ),
            ],
          )),
      appBar: AppBar(
        backgroundColor: ProjectColors.someThings,
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  FaIcon(
                    FontAwesomeIcons.bell,
                    size: 18,
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ],
              ))
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Cotar e Contratar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: size.width,
                          height: 140,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => WebViewScreen(),
                                        transition: Transition.fadeIn);
                                  },
                                  child: CustomCard(
                                    iconData: FontAwesomeIcons.car,
                                    text: "Automóvel",
                                  ),
                                ),
                                CustomCard(
                                  iconData: FontAwesomeIcons.home,
                                  text: "Residência",
                                ),
                                CustomCard(
                                  iconData: FontAwesomeIcons.heart,
                                  text: "Vida",
                                ),
                                CustomCard(
                                  iconData: FontAwesomeIcons.accessibleIcon,
                                  text: "Acidente\nPessoais",
                                ),
                                CustomCard(
                                  iconData: FontAwesomeIcons.motorcycle,
                                  text: "Moto",
                                ),
                                CustomCard(
                                  iconData: FontAwesomeIcons.businessTime,
                                  text: "Empresa",
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Minha Família",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ProjectColors.firstColor,
                    ),
                    width: (size.width / 100) * 90,
                    height: (size.height / 100) * 20,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(home.urlUm.value),
                                ),
                                Text(
                                  "  Larissa Reis Lazzarini",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(home.urlDois.value),
                                ),
                                Text(
                                  "  Alice Lazzarini Maximo",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: CustomHomeButtom(
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ),
                          right: 0,
                          left: 0,
                          bottom: -23,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 30, right: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Contratados",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ProjectColors.secondColor,
                            ProjectColors.thirdColorToGradient
                          ],
                        )),
                    width: (size.width / 100) * 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              backgroundImage:
                              NetworkImage(home.urlCardProfileUm.value),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "  Auto Clássico",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12),
                                ),
                                Text(
                                  "  COMPASS / FCG-7402",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                  "  Renva em 364 dias",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                            Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.angleDown,
                                        size: 13,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ProjectColors.secondColor,
                            ProjectColors.thirdColorToGradient
                          ],
                        )),
                    width: (size.width / 100) * 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              backgroundImage:
                              NetworkImage(home.urlCardProfileDois.value),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "  Residencial Digital",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12),
                                ),
                                Text(
                                  "  R. Arthur Prado 123 - Bela Vista - São Paulo - SP",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                  "  Renova em 364 dias",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                            Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.angleDown,
                                      size: 13,
                                      color: Colors.white,
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ProjectColors.secondColor,
                            ProjectColors.thirdColorToGradient
                          ],
                        )),
                    width: (size.width / 100) * 90,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              backgroundImage:
                              NetworkImage(home.urlCardProfileTres.value),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "  Vida Mulher",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  "  Larissa Reis Lazzarini",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                  "  Renova em 364 dias",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                            Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.angleDown,
                                        size: 13,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    ));
  }
}
