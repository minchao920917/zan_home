import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp();
  @override
  Widget build(BuildContext context) {
    return (new Padding(
      padding: const EdgeInsets.only(
        top: 160.0,
      ),
      child: new Text(
        "还没有账号，请联系 minchao.me",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: Colors.white,
            fontSize: 12.0),
      ),
    ));
  }
}