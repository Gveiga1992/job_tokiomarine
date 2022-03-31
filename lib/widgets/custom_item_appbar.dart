import 'package:flutter/material.dart';

class CustomItemBar extends StatelessWidget {
  Widget itemData;
  String itemBarName;

   CustomItemBar(
      {Key? key, required this.itemData, required this.itemBarName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              itemData,
              SizedBox(
                width: 30,
              ),
              Text(itemBarName,style: TextStyle(color: Colors.white,fontSize: 13),)
            ],
          ),
        ),
        Divider(thickness: 1,color: Colors.grey[700],),
      ],
    );
  }
}
