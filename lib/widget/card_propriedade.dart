import '../domain/propriedade.dart';
import 'package:flutter/material.dart';

class CardPropriedade extends StatefulWidget {
  Propriedade propriedade;

  CardPropriedade({super.key, required this.propriedade});

  @override
  State<CardPropriedade> createState() => _CardPropriedadeState();
}

class _CardPropriedadeState extends State<CardPropriedade> {
  // String getUrlImage() {
  //   return widget.urlImage;
  // }

  Propriedade get propriedade => widget.propriedade;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Stack(
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage:
            AssetImage(propriedade.image),
            radius: 80,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            color: Colors.white,
            child: Text(
              widget.propriedade.nome,

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Text(widget.propriedade.local),
      ],
    ),
    );
  }

}