import 'package:flutter/material.dart';
import 'package:newsapi/app/data/constant/textstyle_constant.dart';

import '../controllers/home_controller.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search News',
        hintStyle: Poppins12L.copyWith(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 0.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 0.2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 0.2),
        ),
        filled: true,
        fillColor: Color(0xffF0F0F0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      ),
      scrollPadding: EdgeInsets.all(5),
      onChanged: (val) {
        controller.findNews.value = val;
        controller.update();
      },
    );
  }
}
