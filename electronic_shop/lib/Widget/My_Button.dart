import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

  String ?text;
  final VoidCallback OnPress;

  MyButton({required this.text,required this.OnPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:OnPress,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 50,
        alignment: Alignment.center,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          color: Colors.green[800]
        ),
        child: Text("$text",style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }

}