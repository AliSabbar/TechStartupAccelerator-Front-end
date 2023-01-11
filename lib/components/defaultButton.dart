import 'package:flutter/material.dart';

import '../style/colors.dart';

Widget defaultButton({
  required VoidCallback onTab,
  double width = 348.93,
  double hight = 48,
}){
  return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      onPressed: onTab,
      textColor: Colors.white,
      color: primaryColor,
      minWidth: width,
      height: hight,
      child: const Text(
        "Search",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
}
