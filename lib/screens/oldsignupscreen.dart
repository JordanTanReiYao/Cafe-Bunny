import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUpScreen extends StatefulWidget{
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen>{

  Color primaryColor = Color(0xff118203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation:0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
              children: <Widget>[
                Text(
                  'SIGN UP',
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                SizedBox(
                  height: 50,
                ),
                buildTextField(emailController,'Email', Icons.account_circle, false),
                SizedBox(height: 30),
                buildTextField(passwordController, 'Password', Icons.lock, true),
                SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async{
                    if (emailController.text == "" || passwordController.text == ""){
                      print("Please enter both email and password.");
                      return;
                    }
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: logoGreen,
                  child: Text('Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
              ]
          ),
        )
    );
  }

  buildTextField(TextEditingController kController,String labelText, IconData icon, bool obscure){
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color:Colors.blue)),
      child: TextField(
        controller:kController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
            obscureText: obscure,
      ),
    );
  }
}