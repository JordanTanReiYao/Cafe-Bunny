import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home/home_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>{

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
          'Sign in to Cafe Bunny',
          textAlign: TextAlign.center,
          style:
          GoogleFonts.openSans(color: Colors.white, fontSize: 28),
        ),
        SizedBox(height: 20),
        Text(
          'Enter your email and password below to continue to the The Growing Developer and let the learning begin!',
          textAlign: TextAlign.center,
          style:
          GoogleFonts.openSans(color: Colors.white, fontSize: 14),
        ),
        SizedBox(
          height: 50,
        ),
            buildTextField(emailController, 'Email', Icons.account_circle, false),
            SizedBox(height: 30),
            buildTextField(passwordController, 'Password', Icons.lock, true),
            SizedBox(height: 30),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () async{
                if (emailController.text  == "" || passwordController.text == ""){
                  print("Please enter both email and password.");
                  return;
                }
              },
              color: logoGreen,
              child: Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              textColor: Colors.white,
            ),
            SizedBox(height: 20),
            MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () async{
                //Here goes the logic for Google SignIn discussed in the next section
                Future<UserCredential> signInWithGoogle() async {
                  // Trigger the authentication flow
                  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

                  // Obtain the auth details from the request
                  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

                  // Create a new credential
                  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
                    accessToken: googleAuth.accessToken,
                    idToken: googleAuth.idToken,
                  );

                  // Once signed in, return the UserCredential
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HomeScreen()));
                  return await FirebaseAuth.instance.signInWithCredential(credential);
                }
              },
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesomeIcons.google),
                  SizedBox(width: 10),
                  Text('Sign-in using Google',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              textColor: Colors.white,
            ),
            SizedBox(height: 100)
        ]
        ),
      )
    );
  }

  buildTextField(TextEditingController kController, String labelText, IconData icon, bool obscure){
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor,
          border: Border.all(color:Colors.blue)),
      child: TextField(
        controller: kController,
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