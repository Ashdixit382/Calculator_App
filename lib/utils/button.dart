import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final textcolor;
  final color;
  final String textname;
  final buttonTap;

  const MyButton(
      {super.key,
      required this.textcolor,
      required this.color,
      required this.textname,
      this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                textname,
                style: TextStyle(color: textcolor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
