import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final String label;
  final IconData icon;


  TextFields({Key? key, required this.label, required this.icon})
      : super(key: key);

  Color bg = Color(0xFF131419);
  Color text = Color(0xFFFF0048);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).cursorColor,
      maxLength: 20,
      style: TextStyle(color: Colors.white, fontSize: 11.0, fontFamily: 'mons'),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: text,
          fontFamily: 'mons',
          fontSize: 11.0,
        ),
        prefixIcon: Icon(
          icon,
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
      ),

    );
  }
}
