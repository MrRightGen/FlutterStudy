import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget {
  const LoadMore({Key key, this.hasMore}) : super(key: key);

  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    if (hasMore) {
      return Container(
        height: 70.0,
        child: Center(
          child: Opacity(
            opacity: 1.0,
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 70.0,
        child: Center(
          child: Text('亲，我也是有底线的',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
      );
    }
  }
}
