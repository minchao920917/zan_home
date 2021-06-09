import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class PageSearch extends StatefulWidget {
  PageSearch({Key key}) : super(key: key);

  @override
  _PageSearchState createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  List listData = [];
  TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  getListData() async{
    /*
    > var httpClient = new HttpClient();
    > var request = await httpClient.getUrl(Uri.parse("https://randomuser.me/api?results=30"));
    > var response = await request.close();
    > var responseBody = await response.transform(utf8.decoder).join();
    > //转json
    > var data = jsonDecode(responseBody);
    */


    var url = 'https://apinew.juejin.im/recommend_api/v1/article/recommend_all_feed';
 
    var httpClient = new HttpClient();
    var request = await httpClient.postUrl(Uri.parse(url));

    //post传参
    Map postData = {
      'client_type': '2608', 
      'cursor': '0',
      'id_type':'2',
      'limit':'20',
      'sort_type':'200'
    };
    request.add(utf8.encode(json.encode(postData)));

    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    //转json
    //var data = jsonDecode(responseBody);

    print(responseBody);
  }

  @override
  void initState() { 
    super.initState();
    _tabController = TabController(vsync: this,length: 7);
    
    // getListData();
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  createSearchBar(){
    //一但实例化了controller，务必记得在dispose时销毁掉它
    // final controller = TextEditingController();
    // controller.addListener(() {
    //   print('input ${controller.text}');
    // });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children:[
        Expanded(
          child:Container(
          // padding:EdgeInsets.symmetric(vertical:0,horizontal: 15),
          child:ConstrainedBox(
          constraints: BoxConstraints(
            // maxHeight: 30,
          ),
          child:TextField(
          // controller: controller,
            onChanged: (str){
              print(str);
            },
            onSubmitted: (str){
              print("回车:$str");
            },
            maxLength: 10,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical:0),
              counterText:"",//计数文字
              hintText: "搜索关键字",//placeholder
              prefixIcon:Icon(Icons.search),//前面的图表
              border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),//圆角
                      borderSide: BorderSide.none),
              fillColor: Color.fromARGB(255, 238, 241, 244),//背景色
              filled: true
              ),
          )
        )
      ))]
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Theme(data:ThemeData(splashColor: Colors.transparent,highlightColor: Colors.transparent),child:Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: createSearchBar(),
        bottom:TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blue,
          indicatorColor: Colors.blue,
          controller:_tabController,
          isScrollable:true,
          
          tabs:<Widget>[
            Tab(text: "查天气"),
            Tab(text: "查黄历"),
            Tab(text: "查数据"),
            Tab(text: "查菜谱"),
            Tab(text: "查物流"),
            Tab(text: "查图书"),
            Tab(text: "查日历"),
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
              child: Text("天气")
          ),
          Center(
              child: Text("黄历")
          ),
          Center(
              child: Text("数据")
          ),
          Center(
              child: Text("菜谱")
          ),
          Center(
              child: Text("物流")
          ),
          Center(
              child: Text("图书")
          ),
          Center(
              child: Text("日历")
          ),
        ],
      ),
    ));
  }
}