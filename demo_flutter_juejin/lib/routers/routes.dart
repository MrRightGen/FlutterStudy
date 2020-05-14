import './router_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = '/';
  static String articleDetail = '/detail';
  static String swipPage = '/swip';
  static String webPage = '/web';
  static String loginPage = '/login';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ROUTE WAS NOT FOUND!!1');
        return;
      }
    );

    router.define(articleDetail, handler: articleDetailHandler);
    router.define(swipPage, handler: swipPageHandler);
    router.define(webPage, handler: webPageHandler);
    router.define(loginPage, handler: loginPageHandler);
  }
}