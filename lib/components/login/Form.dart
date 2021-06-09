import 'package:flutter/material.dart';
import './InputFields.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new InputFieldArea(
                hint: "用户名/手机号码",
                obscure: false,
                icon: Icons.person_outline,
              ),
              new InputFieldArea(
                hint: "密码",
                obscure: true,
                icon: Icons.lock_outline,
              ),
            ],
          )),
        ],
      ),
    ));
  }
}