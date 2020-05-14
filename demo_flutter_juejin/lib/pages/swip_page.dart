import 'package:demo_flutter_juejin/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwipPage extends StatefulWidget {
  final String pics;
  final String currentIndex;
  SwipPage({Key key, this.pics, this.currentIndex}) : super(key: key);

  @override
  _SwipPageState createState() => _SwipPageState();
}

class _SwipPageState extends State<SwipPage> {
  

  @override
  Widget build(BuildContext context) {
    List picList = widget.pics.split(',');
    int index = int.parse(widget.currentIndex);
    return Container(
      padding: EdgeInsets.fromLTRB(30, 60, 30, 60),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return Image.network(
            '${picList[index]}',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          );
        },
        loop: false,
        physics: BouncingScrollPhysics(),
        itemCount: picList.length,
        scale: 0.5,
        pagination: SwiperPagination(),
        index: index,
        onTap: (index){
          Application.router.pop(context);
        },
      ),
    );
  }
}