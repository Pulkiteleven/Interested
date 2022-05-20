import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interested_two/MainActivities/HomeScreen.dart';
import 'package:interested_two/SignUp.dart';
import 'package:interested_two/Usefull%20widget/TextField.dart';
import 'package:interested_two/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const SignIn());
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color bg = Color(0xFF131419);
    Color text = Color(0xFF64B5F6);
    String email = "";
    String password = "";


    return SafeArea(
      child: Scaffold(
        backgroundColor: bg,
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
          child: Form(
          key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mainText("Login", Colors.white, 40.0, FontWeight.bold),
                    SizedBox(
                      height: 5.0,
                    ),
                    mainText("and be one", text, 15.0, FontWeight.normal),
                  ],
                ),
                SizedBox(
                  height: 80.0,
                ),
                Column(
                  children: [
                    TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      maxLength: 40,

                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontFamily: 'mons'),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: text,
                          fontFamily: 'mons',
                          fontSize: 11.0,
                        ),
                        errorStyle:TextStyle(
                          color: Colors.red,
                          fontFamily: 'mons',
                          fontSize: 11.0,
                        ) ,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: text,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: text,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        errorBorder:
                        OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        email = text;
                      },
                      validator: (value){
                        if(value!.isEmpty || value == null) {
                          return ("Please Enter a Valid Email");
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      maxLength: 20,
                      keyboardType: TextInputType.visiblePassword,

                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontFamily: 'mons'),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: text,
                          fontFamily: 'mons',
                          fontSize: 11.0,
                        ),
                        errorStyle:TextStyle(
                          color: Colors.red,
                          fontFamily: 'mons',
                          fontSize: 11.0,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: text,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: text,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        errorBorder:
                        OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        password = text;
                      },
                      validator: (value) {
                        if (value!.length <= 6) {
                          return("password length must be more than 6");
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                    Row(
                      children: [
                        Spacer(),
                        SizedBox(
                          width: 80,
                          height: 40,
                          child: ElevatedButton(
                              child: mainText(
                                  "Login", Colors.white, 15.0, FontWeight.normal),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(text),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(color: text)))),
                              onPressed: () {
                                signIn(email, password);
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mainText("Don't have an Account? ", Colors.white, 12.0,
                          FontWeight.normal),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder:
                          (context){
                            return SignUp();
                          }));
                        },
                        child: Text(
                          "CreateOne",
                          style: TextStyle(
                            color: text,
                            fontSize: 12.0,
                            fontFamily: 'mons',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text mainText(String text, Color c, double size, FontWeight w) {
    return Text(
      text,
      style: TextStyle(
        color: c,
        fontSize: size,
        fontFamily: 'mons',
        fontWeight: w,
      ),
    );
  }

  void signIn(String email, String password) async
  {

    if(formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
        Text("Login Succesfull"))),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>
                HomeScreen()))
      });
    }
  }
}
