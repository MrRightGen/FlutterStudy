import 'package:demo_flutter_juejin/routers/application.dart';
import 'package:flutter/material.dart';

class PinsCellPic extends StatelessWidget {

  final List<String> pics;

  PinsCellPic({Key key, this.pics}) : super(key: key);

  List<Widget> _wrapChildren = List();
  double _picHeight = 230.0;

  @override
  Widget build(BuildContext context) {
    if (pics.length > 3) {
      _picHeight = 190.0;
    }
    for (int i = 0; i < pics.length; i += 3) {
      List<Widget> _temRow = List();
      _temRow.add(
        Expanded(
          child: InkWell(
            onTap: () {
              Application.router.navigateTo(context,
                  '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${i.toString()}');
            },
            child: Image.network(
              pics[i],
              fit: BoxFit.cover,
              height: _picHeight,
            ),
          ),
          flex: 1,
        ),
      );
      if (i + 1 < pics.length) {
        _temRow.add(
          SizedBox(
            width: 10.0,
          ),
        );
        _temRow.add(
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Application.router.navigateTo(context,
                    '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${(i + 1).toString()}');
              },
              child: Image.network(
                pics[i + 1],
                fit: BoxFit.cover,
                height: _picHeight,
              ),
            ),
          ),
        );
      }

      if (i + 2 < pics.length) {
        _temRow.add(SizedBox(
          height: 10.0,
        ));

        _temRow.add(
          Expanded(
            child: InkWell(
              onTap: () {
                Application.router.navigateTo(context,
                    '/swip?pics=${Uri.encodeComponent(_buildPicsStr())}&currentIndex=${(i + 2).toString()}');
              },
              child: Image.network(
                pics[i + 2],
                fit: BoxFit.cover,
                height: _picHeight,
              ),
            ),
            flex: 1,
          ),
        );
      }

      _wrapChildren.add(Container(
        child: Row(
          children: _temRow,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      ));
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Wrap(
        children: _wrapChildren,
      ),
    );
  }

  String _buildPicsStr() {
    String picStr = '';
    pics.forEach((element) {
      picStr += '$element,';
    });
    return picStr.substring(0, picStr.length - 1);
  }
}
