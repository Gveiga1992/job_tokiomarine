import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/projetct_colors.dart';

class CustomHomeButtom extends StatelessWidget {
  IconData iconData;
   CustomHomeButtom({Key? key,required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      child: FaIcon(
        iconData,
        color: Colors.white,
        size: 16,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ProjectColors.secondColor,
              ProjectColors
                  .thirdColorToGradient
            ],
          )),
    );
  }
}
