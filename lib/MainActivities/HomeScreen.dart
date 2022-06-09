import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interested_two/Models/colleges_model.dart';
import 'package:interested_two/Models/signup.dart';
import 'package:interested_two/sign_in.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  SignUpModel loogedinuser = SignUpModel();
  CollegesModel collegesModel = CollegesModel();
  List <String>cities = [];
  List <String>colleges = [];
  String selectedcity = "City";
  String selectedcollege = "College";
  String _selectedcc = "";
  late Map<String,dynamic> userValue;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('city');

  CollectionReference _collectionRe =
  FirebaseFirestore.instance.collection('colleges');

  @override
  void initState() {
    var a = FirebaseFirestore.instance;
    a.collection("users").doc(user!.uid).get().then((value) {
      this.loogedinuser = SignUpModel.fromMap(value.data());
      print(user?.uid);
      setState(() {});
    });

    getCityList();
    getColleges();
  }

  Future getCityList() async{
    QuerySnapshot querySnapshot = await _collectionRef.get();

    final allData = querySnapshot.docs.map((e) => e.data()).toList();

    for(var x in allData){
      var b = x as Map;
      cities.add(b['name']);
    }
  }

  Future getColleges() async{
    QuerySnapshot querySnapshot = await _collectionRe.get();

    final allData = querySnapshot.docs.map((e) => e.data()).toList();
    List bb = [];
    for(var x in allData){
      var b = x as Map;
      bb = b['bhopal'];
    }
    for(var x in bb){
      colleges.add(x.toString());
    }
    print(colleges.toString());
  }




    @override
  Widget build(BuildContext context) {
    String name = loogedinuser.name!.split(" ")[0];
    name = loogedinuser.name.toString();
    Color bg = Color(0xFF131419);
    Color text = Color(0xFFB300FF);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bg,
        body: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: Column(
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
                    mainText("Hello $name", Colors.white, 40.0, FontWeight.bold),
                    SizedBox(
                      height: 5.0,
                    ),
                    mainText("Let's get Started", text, 15.0, FontWeight.normal),
                    // Autocomplete<String>(optionsBuilder: (TextEditingValue value){
                    //   if(value.text.isEmpty){
                    //     return[];
                    //   }
                    //   return cities.where((element) =>
                    //   element.toString().toLowerCase().contains(value.text.toLowerCase()));
                    // },
                    //   onSelected: (value) {
                    //     setState(() {
                    //       selectedcity = value;
                    //     });
                    //   },
                    //
                    //   ),
                    SizedBox(
                      height: 60.0,
                    ),
                    SimpleAutoCompleteTextField(suggestions: cities,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontFamily: 'mons'),
                      decoration: InputDecoration(
                        labelText: _selectedcc,
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
                          Icons.location_on_outlined,
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
                      textSubmitted: (text) {
                        setState(() {
                          if(text != ""){
                            selectedcity = text;
                            print(selectedcity);
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SimpleAutoCompleteTextField(suggestions: colleges,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontFamily: 'mons'),
                      decoration: InputDecoration(
                        labelText: selectedcollege,
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
                          Icons.location_city_outlined,
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
                      textSubmitted: (text) {
                      setState(() {
                        if(text != ""){
                          selectedcollege = text;

                        }
                      });
                      },
                    )

                  ],
                ),
                SizedBox(
                  height: 80.0,
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
                            setState(() {
                              _selectedcc = "hello";
                              print(_selectedcc);
                            });
                          }),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //
                //   ],
                // )
              ],
            )));
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

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }
}



