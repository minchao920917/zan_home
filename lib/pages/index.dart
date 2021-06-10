import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/home/swiper.dart';

class PageIndex extends StatefulWidget {
  @override
  _PageIndexState createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Swiper(
                circular: true,
                //reverse: true, //反向
                indicator: RectangleSwiperIndicator(),
                children: <Widget>[
                  Image.asset(
                    "assets/sea.png",
                    fit: BoxFit.fill,
                  ),
                  Image.asset("assets/star.jpg", fit: BoxFit.fill),
                  Image.asset(
                    "assets/cat.jpg",
                    fit: BoxFit.fill,
                  ),
                  Image.asset("assets/horse.jpg", fit: BoxFit.fill),
                ],
              ),
            ),
            Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
              children: <Widget>[
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.red,
                ),
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.green,
                ),
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.blue,
                ),
                new Container(
                  width: 80.0,
                  height: 80.0,
                  color: Colors.yellow,
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
