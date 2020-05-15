class ActivityCell {
  int s;
  String m;
  List<UnitActivity> d;

  ActivityCell({this.s, this.m, this.d});

  //dart中两个同名构造函数不能重载，但是Dart语言为类新增了“命名构造方法”
  //注意： 使用命名构造方法可以为一个类实现多个构造方法，也可以更清晰的表明意图
  
  //命名构造方法
  ActivityCell.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    m = json['m'];
    if (json['d'] != null) {
      d = new List<UnitActivity>();
      json['d'].forEach((v) {
        d.add(new UnitActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['m'] = this.m;
    if (this.d != null) {
      data['d'] = this.d.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnitActivity {
  String sId;
  String eventUrl;
  String title;
  String userId;
  List<String> tag;
  List<TagInfo> tagInfo;
  String content;
  String category;
  String startTime;
  String endTime;
  String city;
  String cityAlias;
  String screenshot;
  int showBanner;
  String bannerStartTime;
  String bannerEndTime;
  String createdAt;
  String updatedAt;

  UnitActivity(
      {this.sId,
      this.eventUrl,
      this.title,
      this.userId,
      this.tag,
      this.tagInfo,
      this.content,
      this.category,
      this.startTime,
      this.endTime,
      this.city,
      this.cityAlias,
      this.screenshot,
      this.showBanner,
      this.bannerStartTime,
      this.bannerEndTime,
      this.createdAt,
      this.updatedAt});

  UnitActivity.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventUrl = json['eventUrl'];
    title = json['title'];
    userId = json['userId'];
    tag = json['tag'].cast<String>();
    if (json['tagInfo'] != null) {
      tagInfo = new List<TagInfo>();
      json['tagInfo'].forEach((v) {
        tagInfo.add(new TagInfo.fromJson(v));
      });
    }
    content = json['content'];
    category = json['category'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    city = json['city'];
    cityAlias = json['cityAlias'];
    screenshot = json['screenshot'];
    showBanner = json['showBanner'];
    bannerStartTime = json['bannerStartTime'];
    bannerEndTime = json['bannerEndTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['eventUrl'] = this.eventUrl;
    data['title'] = this.title;
    data['userId'] = this.userId;
    data['tag'] = this.tag;
    if (this.tagInfo != null) {
      data['tagInfo'] = this.tagInfo.map((v) => v.toJson()).toList();
    }
    data['content'] = this.content;
    data['category'] = this.category;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['city'] = this.city;
    data['cityAlias'] = this.cityAlias;
    data['screenshot'] = this.screenshot;
    data['showBanner'] = this.showBanner;
    data['bannerStartTime'] = this.bannerStartTime;
    data['bannerEndTime'] = this.bannerEndTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class TagInfo {
  String id;
  String title;

  TagInfo({this.id, this.title});

  TagInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}