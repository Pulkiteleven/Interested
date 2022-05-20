import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interested_two/Models/signup.dart';
import 'package:interested_two/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String cpassword = "";
  String name = "";

  @override
  Widget build(BuildContext context) {

    Color bg = Color(0xFF131419);
    Color text = Color(0xFF64B5F6);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    mainText("Signup", Colors.white, 40.0, FontWeight.bold),
                    SizedBox(
                      height: 5.0,
                    ),
                    mainText("and be interested", text, 15.0, FontWeight.normal),
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
                        labelText: "Name",
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
                          Icons.account_circle_outlined,
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
                        errorBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red
                          )
                        ),
                      ),
                      onChanged: (text) {
                        name = text;
                      },
                      validator: (value){
                        if(value!.isEmpty || value == null){
                          return ("Please Enter a Name");
                        }
                        else{
                          return null;
                        }
                      },
                    ), // name
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
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: text,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: text,
                          ),
                        ),
                        errorBorder:
                        OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        email = text;
                      },
                      validator: (value){
                        if(value!.isEmpty || value == null){
                          return("Please Enter a Valid Email");
                        }
                      },
                    ), // email
                    TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      maxLength: 40,
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
                          Icons.lock_open,
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
                        if (value!.isEmpty || value == null) {
                          return("Please Enter a Password");
                        }
                        else if(value.length <= 6){
                          return("Password must be more than 6");
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      cursorColor: Theme.of(context).cursorColor,
                      maxLength: 40,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontFamily: 'mons'),
                      decoration: InputDecoration(
                        labelText: "ConfirmPassword",
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
                        cpassword = text;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value == null || password != cpassword) {
                          return("Both passwords must be same");
                        }
                      },
                    ), // password
                    Row(
                      children: [
                        Spacer(),
                        SizedBox(
                          width: 80,
                          height: 40,
                          child: ElevatedButton(
                              child: Expanded(
                                child: mainText(
                                    "SignUp", Colors.white, 12.0, FontWeight.normal),
                              ),
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
                                signUp(email, password);
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
                      mainText("Already have an Account ", Colors.white, 12.0,
                          FontWeight.normal),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder:
                              (context){
                            return SignIn();
                          }));
                        },
                        child: Text(
                          "Signin",
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

  void signUp(String email, String password) async{
    if(formKey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password)
          .then((value) =>
      {
        postDetailsToFirestore()
      });
    }
  }

  postDetailsToFirestore() async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    SignUpModel models = SignUpModel();

    models.email = user!.email;
    models.uid = user.uid;
    models.name = name;
    models.password = password;
    models.cpassword = cpassword;

    await firestore.collection("users")
    .doc(user.uid)
    .set(models.toMap());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
    Text("User Created")));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>
            SignIn()));

  }
}
