import 'package:flutter/widgets.dart';

class PageFeidian extends StatefulWidget {
  @override
  _PageFeidianState createState() => _PageFeidianState();
}

class _PageFeidianState extends State<PageFeidian> {

  @override
  void initState() { 
    super.initState();
    print("feidian init");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:Text("沸点")),
    );
  }
}