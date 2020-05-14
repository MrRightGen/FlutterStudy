import 'package:flutter/material.dart';
import '../model/pins_cell.dart';
import './pins_cell_header.dart';
import './pins_cell_link.dart';
import './pins_cell_pic.dart';
import './pins_cell_topic.dart';
import './pins_cell_url.dart';
import './pins_cell_bottom_button.dart';

class PinsListCell extends StatefulWidget {
  PinsListCell({Key key, this.unitList}) : super(key: key);
  final UnitList unitList;
  @override
  _PinsListCellState createState() => _PinsListCellState();
}

class _PinsListCellState extends State<PinsListCell> {
  TextStyle _textStyle = TextStyle(color: Colors.black);

  List<Widget> _buildContent(String content) {
    List<Widget> contentList = List();
    RegExp url = RegExp(r'((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+');
    List listString = content.split(url);

    List listUrl = List();
    Iterable<Match> matches = url.allMatches(content);
    int urlIndex = 0;
    for (Match m in matches) {
      listUrl.add(m.group(0));
    }

    for (var i = 0; i < listString.length; i++) {
      if (listString[i] == '') {
        // 空字符串说明应该填充Url
        contentList.add(PinsCellLink(
          linkUrl: listUrl[urlIndex],
        ));
        urlIndex += 1;
      } else {
        contentList.add(Text(
          listString[i],
          style: _textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        ));
      }
    }
    return contentList;
  }

  Widget _renderContent(String content) {
    return Wrap(
      direction: Axis.horizontal,
      verticalDirection: VerticalDirection.down,
      spacing: 10.0,
      children: _buildContent(content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                PinsCellHeader(
                  userInfo: widget.unitList.user,
                  createdAt: widget.unitList.createdAt,
                ),
                _renderContent(widget.unitList.content),
                widget.unitList.url == ''
                    ? PinsCellPic(
                        pics: widget.unitList.pictures,
                      )
                    : PinsCellUrl(
                        url: widget.unitList.url,
                        urlPic: widget.unitList.urlPic,
                        urlTitle: widget.unitList.urlTitle,
                      ),
                widget.unitList.topic == null
                    ? Container()
                    : PinsCellTopic(topicInfo: widget.unitList.topic),
              ],
            ),
          ),
          PinsCellBottomButton(
            commentCount: widget.unitList.commentCount,
            likedCount: widget.unitList.likedCount,
          ),
        ],
      ),
    );
  }
}
