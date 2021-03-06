// ignore: file_names

import 'package:catering_flutter_frontend/config/index.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final String placeholder;
  final Function(String) onChange;

  const SearchInput(
      {Key? key, required this.placeholder, required this.onChange})
      : super(key: key);

  @override
  SearchInputState createState() => SearchInputState();
}

class SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          style: const TextStyle(
              fontFamily: 'Klavika-Light', fontSize: 18, color: COLOR_BLACK, height: 1.4),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            border: InputBorder.none,
            hintText: widget.placeholder,
            suffixIcon: const Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(
                Icons.search_outlined,
              ),
            ),
          ),
          onChanged: widget.onChange,
        ),
        decoration: BoxDecoration(
          color: COLOR_WHITE,
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  color: COLOR_BLACK.withOpacity(0.25),
                  blurRadius: 2)
            ]));
  }
}
