import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zan_home/pages/index.dart';
import 'package:zan_home/pages/Search/search.dart';
import 'package:zan_home/pages/me.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentIndex = 0;
  List pages = <Widget>
  [PageIndex(),PageSearch(),PageMe()];
  
  PageController _controller = PageController(initialPage: 0);

  changePage(index){
      _controller.jumpToPage(index);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap:(index){
          changePage(index);
        },
        currentIndex: currentIndex,
        selectedLabelStyle: TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "查找"
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我"
          ),
        ],
      ),
      body: PageView.builder(
        physics:NeverScrollableScrollPhysics(),
        controller:_controller,
        itemCount:pages.length,
        itemBuilder: (context,index){
          return pages[index];
        },
        onPageChanged: (index){
          setState((){
            currentIndex = index;
          });
        },
      )
    );
  }
}
