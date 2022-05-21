import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interested_two/Models/signup.dart';
import 'package:interested_two/sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
  {
  User? user = FirebaseAuth.instance.currentUser;
  SignUpModel loogedinuser = SignUpModel();


  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){
    this.loogedinuser = SignUpModel.fromMap(value.data());
    setState(() {});
  });
  }

  @override
  Widget build(BuildContext context) {

    String name = loogedinuser.name!.split(" ")[0];
    Color bg = Color(0xFF131419);
    Color text = Color(0xFF64B5F6);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bg,
        body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainText("INTERESTED", text, 10.0, FontWeight.normal),
            SizedBox(
              height: 10.0,
            ),
            mainText("Hello $name,", Colors.white, 40.0, FontWeight.bold),
            SizedBox(
              height: 5.0,
            ),
            mainText("Let's get Started", text, 15.0, FontWeight.normal)
          ],
        )
      ],
    ))
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

  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

}
