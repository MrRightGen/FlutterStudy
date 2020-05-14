import 'package:demo_flutter_juejin/pages/article_detail.dart';
import 'package:demo_flutter_juejin/pages/login.dart';
import 'package:demo_flutter_juejin/pages/page_for_web.dart';
import 'package:demo_flutter_juejin/pages/swip_page.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

Handler articleDetailHandler = Handler(
  handlerFunc: (BuildContext context,Map<String, List<String>> params) {
    String articleId = params['id']?.first;
    String title = params['title']?.first;
    print('index>,articleDetail id is $articleId');
    return ArticleDetail(articleId: articleId,title: title,);
  }
);

Handler swipPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String, List<String>> params) {
    String pics = params['pics']?.first;
    String index = params['currentIndex']?.first;
    print(pics);
    return SwipPage(pics: pics,currentIndex: index,);
  }
);

Handler webPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String, List<String>> params) {
    String articleUrl = params['url']?.first;
    String title = params['title']?.first;
    print('$articleUrl and  $title');
    return PageForWeb(articleUrl: articleUrl,title: title,);
  }
);

Handler loginPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Login();
});