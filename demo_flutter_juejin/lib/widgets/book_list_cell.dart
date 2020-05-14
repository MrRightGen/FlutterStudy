import 'package:demo_flutter_juejin/model/book_cell.dart';
import 'package:demo_flutter_juejin/routers/application.dart';
import 'package:demo_flutter_juejin/util/util.dart';
import 'package:demo_flutter_juejin/widgets/in_text_dot.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class BookListCell extends StatefulWidget {
  final BookCellDetail cellData;

  BookListCell({Key key, this.cellData}) : super(key: key);

  @override
  _BookListCellState createState() => _BookListCellState();
}

class _BookListCellState extends State<BookListCell> {
  @override
  Widget build(BuildContext context) {
    final Color accentColor = Theme.of(context).accentColor;
    final Color primaryColor = Colors.blueAccent;
    return InkWell(
      onTap: (){
        String url = "https://juejin.im/book/${widget.cellData.sId}";
        Application.router.navigateTo(context, '/detail?id=${Uri.encodeComponent(url)}&title=${Uri.encodeComponent(widget.cellData.title)}', transition: TransitionType.native);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Util.setPercentage(0.03, context),
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: accentColor, width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                right: Util.setPercentage(0.03, context),
              ),
              child: Image.network(
                '${widget.cellData.img}',
                width: Util.setPercentage(0.2, context),
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: Util.setPercentage(0.5, context),
              margin: EdgeInsets.only(
                right: Util.setPercentage(0.01, context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${widget.cellData.title}',
                    style: TextStyle(
                      color: Color(0xFF34383B),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${widget.cellData.userData.username}',
                    style: TextStyle(
                      color: Color(0xFF34383B),
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '${widget.cellData.section.length}小节',
                        style: TextStyle(color: accentColor),
                      ),
                      InTextDot(),
                      Text(
                        '${widget.cellData.buyCount}人已购买',
                        style: TextStyle(color: accentColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Color(0xFFF0F7FF),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Text(
                '￥${widget.cellData.price}',
                style: TextStyle(color: primaryColor, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
