import 'package:demo_flutter_juejin/event/event_bus.dart';
import 'package:demo_flutter_juejin/event/event_model.dart';
import 'package:demo_flutter_juejin/widgets/login_button.dart';
import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './index_page.dart';
import './pins_page.dart';
import './book_page.dart';
// import './repos_page.dart';
import './activity_page.dart';
import '../routers/application.dart';
import '../routers/routes.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  _MyAppState() {
    //在构造函数中去初始化我们的Routers

    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    final eventBus = EventBus();
    ApplicationEvent.event = eventBus;
  }

  final TextStyle tabTextStyleNormal =
      TextStyle(color: const Color(0xffdddddd));

  final TextStyle tabTextStyleSelected =
      TextStyle(color: const Color(0xff4d91fd));

  final List<Tab> _bottomTabs = <Tab>[
    Tab(
      text: '首页',
      icon: Icon(Icons.home),
    ),
    Tab(
      text: '沸点',
      icon: Icon(Icons.chat),
    ),
    Tab(
      text: '小册',
      icon: Icon(Icons.book),
    ),
    Tab(
      text: '活动',
      icon: Icon(Icons.local_activity),
    ),
  ];

  var _body;

  List _appBarTitle = ['首页', '沸点', '小册', '活动'];

  TabController _tabController;

  String _userName = '';
  String _userPic = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _bottomTabs.length);

    ApplicationEvent.event.on<UserLoginEvent>().listen((event) {
      setState(() {
        _userName = event.userName;
        _userPic = event.userPic;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        //最后在我们的MaterialApp中的onGenerateRoute中注入进入即可
        onGenerateRoute: Application.router.generator,
        title: 'Flutter_juejin',
        theme: ThemeData(primaryColor: const Color.fromRGBO(77, 145, 253, 1.0)),
        home: Scaffold(
          appBar: AppBar(
            leading: Image.asset(
              'images/logo.png',
            ),
            backgroundColor: Colors.white,
            title: Text('Flutter 版 web 掘金'),
            actions: <Widget>[
              LoginButton(
                userName: _userName,
                userPic: _userPic,
              ),
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              IndexPage(),
              PinsPage(),
              BookPage(),
              ActivityPage(),
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: Material(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              tabs: _bottomTabs,
              controller: _tabController,
              indicatorColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
