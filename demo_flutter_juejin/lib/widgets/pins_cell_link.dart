import 'package:demo_flutter_juejin/routers/application.dart';
import 'package:flutter/material.dart';

class PinsCellLink extends StatelessWidget {
  final String linkUrl;

  PinsCellLink({this.linkUrl});

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).primaryColor;
    return Container(
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(context,
              '/detail?id=${Uri.encodeComponent(linkUrl)}&title=${Uri.encodeComponent('掘金沸点')}');
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.link,
              color: textColor,
            ),
            Text(
              '网页链接',
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
