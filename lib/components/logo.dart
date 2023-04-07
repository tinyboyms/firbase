import 'dart:math';
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imgpath;
  const SquareTile({
    super.key,
    required this.imgpath,
});

  @override
  Widget build(BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white),
          ),
          child: Image.asset(imgpath,height:40,fit:BoxFit.cover),
        );
  }
}