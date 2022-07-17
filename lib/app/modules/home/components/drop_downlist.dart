import 'package:flutter/material.dart';

import '../../../data/constant/textstyle_constant.dart';

GestureDetector dropDownList({name, call}) {
  return GestureDetector(
    child: ListTile(
      title: Text(
        name,
        style: Poppins12R,
      ),
      onTap: call,
    ),
  );
}
