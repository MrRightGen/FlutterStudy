import 'package:flutter/material.dart';
import '../util/data_utils.dart';
import '../model/book_cell.dart';
import '../widgets/book_list_cell.dart';

class BookPageTabView extends StatefulWidget {
  final String alias;

  BookPageTabView({Key key, this.alias}) : super(key: key);

  @override
  _BookPageTabViewState createState() => _BookPageTabViewState();
}

class _BookPageTabViewState extends State<BookPageTabView> {
  Map<String, dynamic> _params = {
    "uid": '',
    'client_id': '',
    'token': '',
    'src': 'web',
    'pageNum': 1,
  };

  List<BookCellDetail> _bookList = <BookCellDetail>[];

  _getBookList() {
    if (widget.alias == 'all') {
      _params['alias'] = '';
    } else {
      _params['alias'] = widget.alias;
    }

    DataUtils.getBookListData(_params).then((resuleList) {
      if (this.mounted) {
        setState(() {
          _bookList = resuleList;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getBookList();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return BookListCell(
      cellData: _bookList[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_bookList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: _bookList.length,
      );
    }
  }
}
