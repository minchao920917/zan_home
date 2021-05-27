import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed:(){
      print("哈哈");
    },child:Text("哈哈"));
  }
}