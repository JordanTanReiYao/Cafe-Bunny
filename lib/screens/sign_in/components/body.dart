import 'package:Cafe_Bunny/components/custom_suffix_icon.dart';
import 'package:Cafe_Bunny/components/default_button.dart';
import 'package:Cafe_Bunny/screens/account/account_screen.dart';
import 'package:Cafe_Bunny/size_config.dart';
import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/constants.dart';
import 'package:Cafe_Bunny/components/form_error.dart';
import 'package:flutter/services.dart';
import 'package:Cafe_Bunny/components/no_account_text.dart';
import 'package:Cafe_Bunny/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign in with your email and password \n or continue with google sign in",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              SignForm(),
              SizedBox(height: getProportionateScreenHeight(20)),
              NoAccountText(),
            ],
          )),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            FormError(errors: errors),
            DefaultButton(
              text: "Sign In",
              press: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));

                    print("You have successfully logged in with email");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showAlertDialog(context, "User not found", kUserNotFound);
                    } else if (e.code == 'wrong-password') {
                      showAlertDialog(
                          context, "Wrong password", kWrongPassword);
                    }
                  }
                }
              },
            ),
          ],
        ));
  }

  showAlertDialog(BuildContext context, String titleError, String errorMsg) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(titleError),
      content: Text(errorMsg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          iconDefined: Icon(
            Icons.email,
            color: Colors.grey,
            size: 24.0,
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter you password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          iconDefined: Icon(
            Icons.lock,
            color: Colors.grey,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
