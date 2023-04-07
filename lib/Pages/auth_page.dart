import 'dart:math';
import 'package:firbase/Pages/Login_page.dart';
import 'package:firbase/Pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'loginorregisterpage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
              if(snapshot.hasData)
                {
                  return HomePage();
                }
              else
              {
                return LoginOrRegister();
              }
        },

      ),
    );
  }
}
