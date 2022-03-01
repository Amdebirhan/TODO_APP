import 'package:flutter/material.dart';
import 'package:todo_app/ui/theme.dart';

class CustomButton extends StatelessWidget {
  final String lable;
  final Function()? onTap;
  const CustomButton({Key? key, required this.lable, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: primaryClr),
        child: Align(
          alignment: Alignment
              .center, // Align however you like (i.e .centerRight, centerLeft)
          child: Text(
            lable,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
