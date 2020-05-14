import 'package:flutter/material.dart';
import '../routers/application.dart';
import 'dart:core';
import '../model/pins_cell.dart';

class PinsCellTopic extends StatelessWidget {
  final Topic topicInfo;

  const PinsCellTopic({Key key, this.topicInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _textColor = Theme.of(context).primaryColor;
    return InkWell(
      onTap: () {
        String _preUrl =
            'https://juejin.im/topic/' + '${topicInfo.objectId}';
        Application.router.navigateTo(context,
            '/detail?id=${Uri.encodeComponent(_preUrl)}&title=${Uri.encodeComponent(topicInfo.title)}');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.5),
        decoration: BoxDecoration(
            border: Border.all(
              color: _textColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15.0),
              right: Radius.circular(15.0),
            )),
        child: Text(
          '${topicInfo.title}',
          style: TextStyle(color: _textColor),
        ),
      ),
    );
  }
}
