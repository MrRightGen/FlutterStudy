import 'package:demo_flutter_juejin/constants/Constants.dart';
import 'package:demo_flutter_juejin/model/index_cell.dart';
import 'package:demo_flutter_juejin/util/data_utils.dart';
import 'package:demo_flutter_juejin/widgets/index_list_header.dart';
import 'package:demo_flutter_juejin/widgets/load_more.dart';
import 'package:flutter/material.dart';
import '../widgets/index_list_cell.dart';

const pageIndexArray = Constants.RANK_BEFORE;

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<Entrylist> list = List();

  Map<String, dynamic> _params = {"src": 'web', "category": "all", "limit": 20};

  int _pageIndex = 0;
  bool _hasMore = true;
  bool _showBackTop = false;

  // bool _isRequesting = false; //是否正在请求数据的flag

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _getList(false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('loadMore');
        print('pageIndex --$_pageIndex');
        _getList(true);
      }
      // setState(() {
      //   _showBackTop = _scrollController.position.pixels >= 800.0;
      // });
      // _scrollController.position.pixels 获取当前滚动部件滚动的距离
      // 当滚动距离大于 800 之后，显示回到顶部按钮
      // setState(() => _showBackTop = _scrollController.position.pixels >= 800);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(this.list.length);
    if (list.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: list.length + 2, //添加一个header 和 loadMore
          itemBuilder: (context, index) => _renderList(context, index),
          controller: _scrollController,
        ),
      ),
      floatingActionButton: _showBackTop
          ? FloatingActionButton(
              child: Icon(Icons.vertical_align_top),
              onPressed: () {
                this._scrollToTop();
              },
            )
          : FloatingActionButton(
              child: Icon(Icons.vertical_align_top),
              onPressed: () {
                this._scrollToTop();
              },
            ),
    );
  }

  _scrollToTop() {
    this
        ._scrollController
        .jumpTo(_scrollController.position.minScrollExtent + 1.0);
    // this._scrollController.animateTo(0.0,
    //     duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  _getList(bool isLoadMore) {
    if (!isLoadMore) {
      // reload的时候重置page
      _pageIndex = 0;
    }
    _params['before'] = pageIndexArray[_pageIndex];

    DataUtils.loadIndexCellModel(_params).then((result) {
      if (isLoadMore == false) {
        list.clear();
        list.addAll(result);
      }

      //注意这里需要重置一切请求条件
      //The RefreshIndicator onRefresh callback must return a Future.
      setState(() {
        _pageIndex = (result.length > 0) ? (_pageIndex += 1) : _pageIndex;
        list.addAll(result);
        _hasMore = (_pageIndex < pageIndexArray.length && result.length > 0);
        print(
            '_hasMore--$_hasMore  _pageIndex --$_pageIndex  pageIndexArray --${pageIndexArray.length}');
      });
    });
  }

  _renderList(BuildContext context, int index) {
    if (index == 0) {
      return IndexListHeader(hasLogin: false);
    } else if (index == list.length + 1) {
      return LoadMore(hasMore: _hasMore);
    } else {
      return IndexListCell(entrylist: list[index - 1]);
    }
  }

  //下拉刷新
  //下拉刷新的方法中setState是为了重新build，毕竟空列表页面会有loading的出现。
  Future<void> _onRefresh() async {
    _getList(false);
    return null;
  }
}
