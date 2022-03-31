import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_vitoria_desafio/theme/projetct_colors.dart';

class CustomCard extends StatelessWidget {
  IconData iconData;
  String text;

  CustomCard({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ProjectColors.firstColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (shader) => LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ProjectColors.secondColor,
                  ProjectColors.thirdColorToGradient
                ],
              ).createShader(shader),
              child: FaIcon(
                iconData,
                size: 20,
              ),
            ),
            Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        ),
        width: 100,
        height: 110,
      ),
    );
  }
}
