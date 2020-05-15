import 'package:demo_flutter_juejin/model/activity_cell.dart';
import 'package:demo_flutter_juejin/model/activity_nav.dart';
import 'package:demo_flutter_juejin/model/book_cell.dart';
import 'package:demo_flutter_juejin/model/book_nav.dart';
import 'package:demo_flutter_juejin/model/pins_cell.dart';
import 'package:demo_flutter_juejin/model/repos_cell.dart';
import 'package:demo_flutter_juejin/util/net_utils.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../model/index_cell.dart';
import '../api/api.dart';

class DataUtils {
  static Future<String> _loadAStudentAsset() async {
    return await rootBundle.loadString('assets/indexListData.json');
  }

  static Future<List<Entrylist>> loadIndexCellModel(
      Map<String, dynamic> params) async {
    // String jsonString = await _loadAStudentAsset();
    // final jsonResponse = json.decode(jsonString);
    // IndexCell model = IndexCell.fromJson(jsonResponse);
    try {
      var response = await NetUtils.get(Api.RANK_LIST, params: params);

      //使用命名构造方法创建对象
      IndexCell model = IndexCell.fromJson(response);
      return model.d?.entrylist ?? List();
    } catch (e) {
      // No specified type, handles all
      print('loadIndexCellModel $e');
      return List();
    }
  }

  static Future<List<UnitList>> getPinsListData(
      Map<String, dynamic> params) async {
    try {
      var response = await NetUtils.get(Api.PINS_LIST, params: params);
      PinsCell model = PinsCell.fromJson(response);
      return model.d?.list ?? List();
    } catch (e) {
      // No specified type, handles all
      
      print('getPinsListData $e');
      return List();
    }
  }

  //获取小册导航栏
  static Future<List<BookNavDetail>> getBookNavData() async {
    try {
      var response = await NetUtils.get(Api.BOOK_NAV);
      BookNav model = BookNav.fromJson(response);
      return model?.bookNavList ?? List();
    } catch (e) {
      // No specified type, handles all
      print('getBookNavData $e');
      return List();
    }
  }

  //获取小册
  static Future<List<BookCellDetail>> getBookListData(
      Map<String, dynamic> params) async {
    try {
      var response = await NetUtils.get(Api.BOOK_LIST, params: params);
      BookCell model = BookCell.fromJson(response);
      return model?.bookCellList ?? List();
    } catch (e) {
      // No specified type, handles all
      print('getBookListData $e');
      return List();
    }
  }

  // 开源库
  static Future<List<ReposCell>> getReposListData(
      Map<String, dynamic> params) async {
    List<ReposCell> resultList = new List();

    var response = await NetUtils.get(Api.REPOS_LIST, params: params);
    var responseList = response['d']['repoList'];
    for (int i = 0; i < responseList.length; i++) {
      ReposCell reposCell;
      try {
        reposCell = ReposCell.fromJson(responseList[i]);
      } catch (e) {
        print("error $e at $i");
        continue;
      }
      resultList.add(reposCell);
    }

    return resultList;
  }

  //获取城市列表
  static Future<List<CityInfo>> getActivityNavListData(
      Map<String, dynamic> params) async {
    try {
      var response = await NetUtils.get(Api.ACTIVITY_CITY, params: params);
      ActivityNav model = ActivityNav.fromJson(response);
      return model?.d ?? List();
    } catch (e) {
      // No specified type, handles all
      print('getActivityNavListData $e');
      return List();
    }
  }

  //获取活动列表
  static Future<List<UnitActivity>> getActivityListData(
      Map<String, dynamic> params) async {
    try {
      var response = await NetUtils.get(Api.ACTIVITY_LIST, params: params);
      ActivityCell model = ActivityCell.fromJson(response);
      return model?.d ?? List();
    } catch (e) {
      // No specified type, handles all
      print('getActivityListData $e');
      return List();
    }
  }
}
