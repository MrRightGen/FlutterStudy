import 'package:flutter/material.dart';
import '../routers/application.dart';
import 'dart:core';

class PinsCellUrl extends StatefulWidget {

  final String url;
  final String urlPic;
  final String urlTitle;

  PinsCellUrl({Key key, this.url, this.urlPic, this.urlTitle}) : super(key: key);

  @override
  _PinsCellUrlState createState() => _PinsCellUrlState();
}

class _PinsCellUrlState extends State<PinsCellUrl> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, '/detail?id=${Uri.encodeComponent(widget.url)}&title=${Uri.encodeComponent(widget.urlPic)}&');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        height: 100.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${widget.urlTitle}',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${widget.url}',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Theme.of(context).accentColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: Image.network('${widget.urlPic}'),
            ),
          ],
        ),
      ),
    );
  }
}