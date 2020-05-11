# iOS老项目集成Flutter_Boost
Flutter boost: <https://github.com/alibaba/flutter_boost>

官方方案: <https://flutter.dev/docs/development/add-to-app/>

##背景简介
新一代Flutter-Native混合解决方案。FlutterBoost是一个Flutter插件，可以方便的为现有原生程序引入Flutter。FlutterBoost的理念是将Flutter像webview那样来使用。FlutterBoost会帮助使用方处理页面的映射和跳转，使用方只需要关心页面的名字和参数即可（通常可以是URL）

##前置条件
在继续之前，您需要将Flutter集成到你现有的项目中。flutter sdk 的版本需要 v1.9.1-hotfixes，否则会编译失败.

##配置flutter sdk版本
先去[Flutter github](https://github.com/flutter/flutter/releases)查看v1.9.1-hotfixes版本提交记录，这里选择下图的提交记录

![](https://upload-images.jianshu.io/upload_images/9322313-b95a7eebacd22387.png)

打开终端cd进入到存放flutter sdk目录，执行回退

```
git reset --hard ...
```
即可回退到指定版本
然后执行flutter doctor ，等待重新更新下载


具体flutter sdk 跟 flutter_boost 对应的版本关系请参照FlutterBoost[官方文档](https://github.com/alibaba/flutter_boost/blob/master/README_CN.md)

##引入FlutterBoost（以iOS说明）
请确保iOS和Flutter项目的根目录必须在同一目录下

![图片01](https://upload-images.jianshu.io/upload_images/9322313-4c4d952f0488cbb9.png)

cd到当前原生项目所在目录，执行：

```
flutter create -t module flutter_module
```

如果iOS使用swift语言，请加上 -i swift：

```
flutter create -i swift -t module flutter_module
```

等待Flutter module创建完成，用编辑器打开该项目，修改pubspec.yaml文件，添加flutter_boost依赖，此处选择1.12.13+1稳定版本。
![](https://upload-images.jianshu.io/upload_images/9322313-0782e49513823457.png)

以上步骤为Flutter在混编项目中的基本配置操作。

接下来我们在native中接入Flutter_Boost

打开iOS项目Podfile文件，加入以下代码，用于引入Flutter_Boost相关模块。

```
    
  flutter_application_path = '../flutter_module'
  load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
  install_all_flutter_pods(flutter_application_path)

```

然后直行pod install，完成后会引入Development Pods模块:

![](https://upload-images.jianshu.io/upload_images/9322313-369a07bfe2f5bc97.png)

接下来在Build Setting中把Enable Bitcode改为NO。

在Build Phases里添加运行脚本**Run Script**，好让iOS原生运行时自动打包flutter项目

```
"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" build

"$FLUTTER_ROOT/packages/flutter_tools/bin/xcode_backend.sh" embed

```

注意：加上这两句脚本后，项目运行有可能会报错，解决方案：

**勾选脚本下方的 Run script only when installing**

---
---

# iOS运用Flutter_Boost 管理页面跳转
####1. flutter_module项目使用FlutterBoost进行路由配置


```
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/webview_widget.dart';
import 'simple_page_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'embeded': (pageName, params, _)=>EmbededFirstRouteWidget(),
      'first': (pageName, params, _) => FirstRouteWidget(),
      'firstFirst': (pageName, params, _) => FirstFirstRouteWidget(),
      'second': (pageName, params, _) => SecondRouteWidget(),
      'secondStateful': (pageName, params, _) => SecondStatefulRouteWidget(),
      'tab': (pageName, params, _) => TabRouteWidget(),
      'platformView': (pageName, params, _) => PlatformRouteWidget(),
      'flutterFragment': (pageName, params, _) => FragmentRouteWidget(params),
      'flutterWebview': (pageName, params, _) => WebViewExample(params),
      ///可以在native层通过 getContainerParams 来传递参数
      'flutterPage': (pageName, params, _) {
        print("flutterPage params:$params");

        return FlutterRouteWidget(params:params);
      },
    });
    FlutterBoost.singleton.addBoostNavigatorObserver(TestBoostNavigatorObserver());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container(
            color:Colors.white
        ));
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
  }
}
class TestBoostNavigatorObserver extends NavigatorObserver{
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("flutterboost#didPush");
  }

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("flutterboost#didPop");
  }

  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("flutterboost#didRemove");
  }

  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    print("flutterboost#didReplace");
  }
}


```

这里首先在Widget builder中初始化了FlutterBoost，然后在initState方法中通过FlutterBoost为多个页面注册路由，这里注册的路由是原生与flutter通用的，这个后面可以体现。

####2. 在Flutter页面路由中使用FlutterBoost跳转

总结在Flutter中有以下几种跳转方式：
1.Flutter=>Flutter（使用Flutter自己的路由）

```
Navigator.push(context, MaterialPageRoute(builder: (_) => FirstRouteWidget()));
```

以下三种跳转方式，都是通过FlutterBoost进行跳转，使用的是同一个方法，只是场景有所不同

```
FlutterBoost.singleton.open( String url,{Map<dynamic,dynamic> urlParams,Map<dynamic,dynamic> exts)
```

参数分别为：页面名称，通信传参，扩展参数。对应相应跳转方式使用如下：

**Flutter=>Flutter（使用原生的navigationController）**

例：first页面打开路由名称为second页面，传参为{"query": “aaa”}，扩展参数中可以添加一些特殊数据，这里添加了{"animated": true}，在原生中会解析为带动画跳转

```
FlutterBoost.singleton.open( "second",urlParams: {"query": "aaa"}, exts: {"animated": true})
```

**Flutter=>原生（push）**

例：first页面打开原生NativeViewController页面，拼接native将在原生项目中解析为跳转原生页面，拼接push表明跳转方式。

```
FlutterBoost.singleton.open( "native_push_NativeViewController",urlParams: {"query": "aaa"}, exts: {"animated": true})
```


**Flutter=>原生（present）**

同上，使用present跳转方式。

```
FlutterBoost.singleton.open( "native_present_NativeViewController",urlParams: {"query": "aaa"}, exts: {"animated": true})
```

---

另外，Flutter关闭或返回上级页面使用的是close方法，分为两种

**关闭当前页面**

```
FlutterBoost.singleton.closeCurrent(result: {}, exts: {});
```

**通过id关闭指定页面**

```
FlutterBoost.singleton.close('id', result: {}, exts: {});
```

---

####原生项目中配置路由通信

```
#import "PlatformRouterImp.h"
#import "FlutterTestControllerViewController.h"
#import <flutter_boost/FlutterBoost.h>

@interface PlatformRouterImp()
@end

@implementation PlatformRouterImp

- (void)openNativeVC:(NSString *)name
           urlParams:(NSDictionary *)params
                exts:(NSDictionary *)exts{
    UIViewController *vc = FlutterTestControllerViewController.new;
    BOOL animated = [exts[@"animated"] boolValue];
    if([params[@"present"] boolValue]){
        [self.navigationController presentViewController:vc animated:animated completion:^{
        }];
    }else{
        [self.navigationController pushViewController:vc animated:animated];
    }
}

#pragma mark - Boost 1.5
- (void)open:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    if ([name isEqualToString:@"native"]) {//模拟打开native页面
        [self openNativeVC:name urlParams:params exts:exts];
        return;
    }
    
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    [vc setName:name params:params];
    [self.navigationController pushViewController:vc animated:animated];
    if(completion) completion(YES);
}

- (void)present:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    [vc setName:name params:params];
    [self.navigationController presentViewController:vc animated:animated completion:^{
        if(completion) completion(YES);
    }];
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}
@end

```

####初始化FlutterBoost

```

	PlatformRouterImp *route = [PlatformRouterImp new];
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:route onStart:^(FlutterEngine * _Nonnull engine) {

    }];
    route.navigationController = navigationController;
    

```

####原生使用FlutterBoost进行跳转

```
[FlutterBoostPlugin open:@"flutterWebview" urlParams:@{kPageCallBackId:@"MycallbackId#1",@"url":urlString,@"backItem":@(YES)} exts:@{@"animated":@(YES)} onPageFinished:^(NSDictionary *result) {
        
        NSLog(@"flutterWebviewPage finished, and your result is:%@", result);
//        self.finished = YES;
//        self.opened = NO;
    } completion:^(BOOL f) {
//        self.finished = NO;
//        self.opened = YES;
        NSLog(@"flutterWebviewPage is opened");
        
    }];
```