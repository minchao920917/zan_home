import 'package:flutter/widgets.dart';

class PageMe extends StatefulWidget {
  @override
  _PageMeState createState() => _PageMeState();
}

class _PageMeState extends State<PageMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child:Text("我")),
    );
  }
}