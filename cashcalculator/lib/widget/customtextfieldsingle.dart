// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customfdr extends StatelessWidget {
  
  final String title;
  TextEditingController controller;
  final Function(String) onChanged; 

    Customfdr({super.key, required this.title, required this.controller,required this.onChanged});
    
      @override
      Widget build(BuildContext context) {
            return SizedBox(
      height: 39,
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 170,
            child: Card(
              color: Colors.black,
              elevation: 3,
              shadowColor: Colors.cyan,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700,color: Colors.amber),
              ),
            ),
          ),
          
          
          Flexible(
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                fillColor: Colors.amber,
                filled: true,

                //border: OutlineInputBorder(),

                // labelText: 'Number Of Taka',
                labelStyle: TextStyle(color: Colors.black),

                hintText: 'Value',
                hintStyle:  TextStyle(color: Color.fromARGB(255, 124, 123, 124)),
                focusColor: Colors.pink,
                hoverColor: Colors.amber,
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          
      
        ],
      ),
    );
      }


  
  }






























Widget customTextfieldSingle(
  ontap,
  hints,
) {
  return TextField(
    onChanged: ontap,
    //  controller: controller,
    keyboardType: TextInputType.number,
    cursorColor: Colors.black,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
      fillColor: Colors.pink[200],
      filled: true,

      //border: OutlineInputBorder(),

      // labelText: 'Number Of Taka',
      labelStyle: const TextStyle(color: Colors.black),

      hintText: hints,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 124, 123, 124)),
      focusColor: Colors.pink,
      hoverColor: Colors.amber,
    ),
    textInputAction: TextInputAction.next,
  );
}

Widget custom_card(result) {
  return SizedBox(
    height: 40,
    width: 120,
    child: Card(
      elevation: 2,
      color: Colors.pink,
      child: Text(
        result,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    ),
  );
}
