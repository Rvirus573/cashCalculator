import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextBox extends StatelessWidget {
  
  String label;
  
  TextEditingController tc;

  
  TextBox(this.label,this.tc,{super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tc,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
      border : OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      label: Text(label.toUpperCase(),style: GoogleFonts.roboto(fontSize:22,color:Colors.orange,fontWeight:FontWeight.bold)),
      hintText: 'Type Here...',

      hintStyle: GoogleFonts.openSans(fontSize: 18),
      
      ),
    );
  }
}