import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body:Column(
          children: [
            ElevatedButton(
              onPressed: (){
              },
              child: Text('Button'),
              style: ButtonStyle(),
            ),   ElevatedButton(
              onPressed: (){
              },
              child: Text('Button'),
              style: ButtonStyle(),
            ),
            // ElevatedButton(onPressed: (){},child: Text("LOGIN"),),
          ],
        )


    );
  }
}