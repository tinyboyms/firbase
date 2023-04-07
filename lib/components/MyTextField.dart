import 'dart:math';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String htext;
  final bool obtext;

  const MyTextField({
    super.key,
    required this.controller,
    required this.htext,
    required this.obtext,

  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child:  TextField(
        controller:controller ,
        obscureText: obtext,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          hintText: htext,
        ),

      ),
    );

  }
}