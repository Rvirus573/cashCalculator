import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  final Function(String) onChanged;

  final String total;
  final String hint;

  CustomTextField({
    super.key,
    required this.onChanged,
    required this.controller,
    required this.total,
    required this.hint,
  });

  //Widget (noteName, controller, onChanged, total) {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            width: 110,
            child: TextField(
              cursorHeight: 20,
              onChanged: onChanged,
              textAlignVertical: TextAlignVertical.bottom,
              controller: controller,
              keyboardType: TextInputType.number,
              cursorColor: Colors.pink[200],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: hint,
                hintStyle: GoogleFonts.openSans(fontSize: 25),
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          const Text(
            " = ",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Container(
              width: 180,
              height: 49,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      total,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
