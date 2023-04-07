import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firbase/components/logo.dart';
import 'package:firbase/components/MyTextField.dart';
import 'package:firbase/components/signinbtn.dart';
import 'package:firbase/Pages/Login_page.dart';


class  RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const  RegisterPage({super.key,required this.onTap});

  @override
  State< RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State< RegisterPage> {

  //text editing controller
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();






  //sign in user method
  void signUp() async {

    try {
      if(passwordcontroller.text==confirmpasswordcontroller.text)
        {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: usernamecontroller.text,
              password: passwordcontroller.text
          );
        }
      else
        {
          showErrorMessage("Passwpord Dont Match!");
        }
    } on FirebaseAuthException catch (e) {
      //wrong Email
     showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(message),
          //content: Text("Do You Want To Try Again!"),
          // actions: [
          //   CupertinoDialogAction(
          //     child: Text('Yes'),
          //     onPressed: () => Navigator.of(context).pop(true),
          //   ),
          //   CupertinoDialogAction(
          //     child: Text('No'),
          //     onPressed: () => Navigator.of(context).pop(SystemNavigator.pop()),
          //   ),
          // ],
        );
      },
    );

  }

//methods worngEmail and WrongPassword
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        // child: Padding( padding: EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //icon
                SizedBox(
                  height: 80,
                ),
                Icon(
                  Icons.contact_mail_rounded,
                  size: 100,
                ),

                // wellcome text
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Wellcome Back 👋",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),

                SizedBox(
                  height: 30,
                ),

                //username
                MyTextField(
                  controller: usernamecontroller,
                  htext: "Usernmae",
                  obtext: false,
                ),

                SizedBox(
                  height: 10,
                ),

                //passsword
                MyTextField(
                  controller: passwordcontroller,
                  htext: "Password",
                  obtext: true,
                ),
                SizedBox(
                  height: 10,
                ),

                //confirm password
                MyTextField(
                  controller: confirmpasswordcontroller,
                  htext: "Confirm Password",
                  obtext: true,
                ),

                SizedBox(height: 10),

                //forget password
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 25),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text("Forgot Password",
                //           style: TextStyle(
                //               fontSize: 15, color: Colors.grey.shade500)),
                //     ],
                //   ),
                // ),//

                SizedBox(
                  height: 25,
                ),

                //signin button
                SignInButton(
                  text: "Sign Up",
                  onTap: signUp,
                ),

                SizedBox(
                  height: 50,
                ),

                //text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                            height: 5,
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or Continue With",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          )),
                    ],
                  ),
                ),

                // logo button
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imgpath: 'assets/images/google.png'),
                    SizedBox(width: 25),
                    SquareTile(imgpath: 'assets/images/apple.png'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                //text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Alredy have an account?", style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
