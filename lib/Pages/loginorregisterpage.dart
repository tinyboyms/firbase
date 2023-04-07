import 'package:firbase/Pages/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:firbase/Pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //init show log
  bool showloginpage = true;

  //toggle between login and register
  void togglepage() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginPage(onTap: togglepage);
    } else {
      return RegisterPage(onTap: togglepage);
    }
  }
}
