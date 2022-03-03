import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/ui/theme.dart';

class CustomInputField extends StatelessWidget {
  final String text;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const CustomInputField(
      {Key? key,
      required this.hint,
      required this.text,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.blue)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  autofocus: false,
                  readOnly: widget == null ? false : true,
                  cursorColor:
                      Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                  controller: controller,
                  style: subTitleStyle,
                  decoration: InputDecoration(
                    hintText: hint,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.backgroundColor, width: 0)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.backgroundColor, width: 0)),
                  ),
                )),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
