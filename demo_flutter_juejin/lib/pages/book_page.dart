import 'package:demo_flutter_juejin/model/book_nav.dart';
import 'package:demo_flutter_juejin/util/data_utils.dart';
import 'package:demo_flutter_juejin/widgets/book_page_tab_view.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  BookPage({Key key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> with SingleTickerProviderStateMixin {
  List<BookNavDetail> _navData = List();

  List<Tab> _myTabs = <Tab>[
    Tab(
      text: '全部',
    ),
  ];

  List<BookPageTabView> _myTabView = <BookPageTabView>[
    BookPageTabView(
      alias: 'all',
    ),
  ];

  TabController _tabController;

  @override
  void initState() { 
    super.initState();
    _getNavList();
  }

  _getNavList(){
    DataUtils.getBookNavData().then((resultData) {
      resultData.forEach((element) {
        _myTabs.add(Tab(text: element.name));  

        _myTabView.add(BookPageTabView(alias: element.alias,));
      });
      _tabController = TabController(length: resultData.length + 1, vsync: this);
      if(this.mounted) {
        setState(() {
          _navData = resultData;
        });
        
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_navData.length == 0){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: TabBar(
          controller: _tabController,
          tabs: _myTabs,
          indicatorColor: Colors.white,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _myTabView,
      ),
    );
  }
}
