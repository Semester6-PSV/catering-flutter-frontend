// ignore: file_names
import 'package:catering_flutter_frontend/config/index.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final ButtonType type;
  final Function? onClick;

  const CustomButton(
      {Key? key, required this.text, required this.type, required this.onClick})
      : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  Color getButtonColor(String type) {
    if (type == 'background') {
      if (widget.type == ButtonType.primary) {
        return COLOR_RED_DARK;
      }

      if (widget.type == ButtonType.secondary) {
        return COLOR_WHITE;
      }
    }

    if (type == 'text') {
      if (widget.type == ButtonType.primary) {
        return COLOR_WHITE;
      }

      if (widget.type == ButtonType.secondary) {
        return COLOR_GREY;
      }
    }

    return COLOR_RED;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                side: BorderSide(
                    color: COLOR_RED_DARK, width: 1, style: BorderStyle.solid)),
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
            primary: getButtonColor('text'),
            backgroundColor: getButtonColor('background'),
            textStyle: const TextStyle(
                fontFamily: 'Klavika-Bold',
                fontSize: 16)),
        child: Text(
          widget.text,
        ));
  }
}
