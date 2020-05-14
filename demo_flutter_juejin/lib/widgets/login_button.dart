import 'package:flutter/material.dart';
import '../routers/application.dart';
import 'package:fluro/fluro.dart';

class LoginButton extends StatelessWidget {

  final String userName;
  final String userPic;

  const LoginButton({Key key,this.userName, this.userPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(userName == ''){
      return FlatButton(
        onPressed: (){
          Application.router.navigateTo(context, '/login', transition: TransitionType.native);
        },
        child: Text(
          '登录 . 注册',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w200,
          ),
        ),
      );
    } else {
      return Container(
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(userPic),
              child: Text(userName),
            ),
          ],
        ),
      );
    }
  }
}