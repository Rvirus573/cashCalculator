import 'package:flutter/material.dart';

Widget customButton(title, ontap, [color = Colors.cyan]) {
  return SizedBox(
    width: 300,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // background
        foregroundColor: Colors.blue, // foreground
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      onPressed: ontap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
