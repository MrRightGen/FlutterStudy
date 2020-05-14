import 'package:demo_flutter_juejin/routers/application.dart';
import 'package:demo_flutter_juejin/widgets/good_and_comment_cell.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../model/index_cell.dart';
import 'in_text_dot.dart';
import '../util/util.dart';

class IndexListCell extends StatelessWidget {
  IndexListCell({Key key, this.entrylist}) : super(key: key);

  final Entrylist entrylist;

  final TextStyle titleTextStyle = TextStyle(
    color: Color(0xFFB2BAC2),
    fontWeight: FontWeight.w300,
    fontSize: 13.0,
  );

  List<Widget> _buildFirstRow() {
    List<Widget> _listRow = List();

    if (entrylist.hot) {
      _listRow.add(Text(
        '热',
        style: TextStyle(
          color: Color(0xFFF53040),
          fontWeight: FontWeight.w600,
        ),
      ));
      _listRow.add(InTextDot());
    }

    if (entrylist.type == 'post') {
      _listRow.add(Text(
        '专栏',
        style: TextStyle(
          color: Color(0xFFBC30DA),
          fontWeight: FontWeight.w600,
        ),
      ));
      _listRow.add(InTextDot());
    }

    _listRow.add(Text(
      '${entrylist.user.username}',
      style: titleTextStyle,
    ));
    _listRow.add(InTextDot());
    _listRow.add(Text(
      '${Util.getTimeDuration(entrylist.createdAt)}',
      style: titleTextStyle,
    ));
    _listRow.add(InTextDot());
    _listRow.add(Expanded(
      //防止文本超长
      child: Text(
        '${entrylist.tags[0].title}/${entrylist.category.name}',
        style: titleTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    ));
    return _listRow;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 因为涉及中文以及url所以这里我们进行了Uri.encodeComponent
        Application.router.navigateTo(context,
            '/detail?id=${Uri.encodeComponent(entrylist.originalUrl)}&title=${Uri.encodeComponent(entrylist.title)}', transition: TransitionType.native);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 20.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _buildFirstRow(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 9.0),
              child: Text(
                '${entrylist.title}',
                style: TextStyle(
                  color: Color(0xFF393C3F),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GoodAndCommentCell(
                entrylist.collectionCount, entrylist.commentsCount),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              height: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
