import 'package:flutter/material.dart';

class GoodAndCommentCell extends StatelessWidget {
  GoodAndCommentCell(this.collectionCount, this.commentCount);

  final int collectionCount;
  final int commentCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _getCommentOrCollectionWidget(Icons.favorite, this.collectionCount),
        _getCommentOrCollectionWidget(Icons.comment, this.commentCount),
      ],
    );
  }

  _getCommentOrCollectionWidget(IconData iconData, int count) {
    return Container(
      height: 25.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black38,
          )),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              color: Colors.black54,
            ),
            Text('$count'),
          ],
        ),
        onTap: (){
          print('$count');
        },
      ),
    );
  }
}
