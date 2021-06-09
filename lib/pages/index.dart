import 'package:flutter/widgets.dart';
import '../components/homeComponents/swiper.dart';
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
          ],
        ),
      ),
    );
  }
}
