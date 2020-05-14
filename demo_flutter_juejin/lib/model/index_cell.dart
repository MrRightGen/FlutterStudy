
class IndexCell {
  int s;
  String m;
  D d;

  IndexCell({this.s, this.m, this.d});

  IndexCell.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    m = json['m'];
    d = json['d'] != null ? new D.fromJson(json['d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['m'] = this.m;
    if (this.d != null) {
      data['d'] = this.d.toJson();
    }
    return data;
  }
}

class D {
  int total;
  List<Entrylist> entrylist;

  D({this.total, this.entrylist});

  D.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['entrylist'] != null) {
      entrylist = new List<Entrylist>();
      json['entrylist'].forEach((v) {
        entrylist.add(new Entrylist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.entrylist != null) {
      data['entrylist'] = this.entrylist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Entrylist {
  dynamic collectionCount;
  dynamic userRankIndex;
  dynamic buildTime;
  dynamic commentsCount;
  dynamic gfw;
  String objectId;
  bool checkStatus;
  bool isEvent;
  String entryView;
  dynamic subscribersCount;
  dynamic ngxCachedTime;
  bool verifyStatus;
  List<Tags> tags;
  String updatedAt;
  dynamic rankIndex;
  bool hot;
  bool autoPass;
  String originalUrl;
  String verifyCreatedAt;
  String createdAt;
  User user;
  String author;
  String screenshot;
  bool original;
  dynamic hotIndex;
  String content;
  String title;
  String lastCommentTime;
  String type;
  bool english;
  Category category;
  dynamic viewsCount;
  String summaryInfo;
  bool isCollected;

  Entrylist(
      {this.collectionCount,
      this.userRankIndex,
      this.buildTime,
      this.commentsCount,
      this.gfw,
      this.objectId,
      this.checkStatus,
      this.isEvent,
      this.entryView,
      this.subscribersCount,
      this.ngxCachedTime,
      this.verifyStatus,
      this.tags,
      this.updatedAt,
      this.rankIndex,
      this.hot,
      this.autoPass,
      this.originalUrl,
      this.verifyCreatedAt,
      this.createdAt,
      this.user,
      this.author,
      this.screenshot,
      this.original,
      this.hotIndex,
      this.content,
      this.title,
      this.lastCommentTime,
      this.type,
      this.english,
      this.category,
      this.viewsCount,
      this.summaryInfo,
      this.isCollected});

  Entrylist.fromJson(Map<String, dynamic> json) {
    collectionCount = json['collectionCount'];
    userRankIndex = json['userRankIndex'];
    buildTime = json['buildTime'];
    commentsCount = json['commentsCount'];
    gfw = json['gfw'];
    objectId = json['objectId'];
    checkStatus = json['checkStatus'];
    isEvent = json['isEvent'];
    entryView = json['entryView'];
    subscribersCount = json['subscribersCount'];
    ngxCachedTime = json['ngxCachedTime'];
    verifyStatus = json['verifyStatus'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
    rankIndex = json['rankIndex'];
    hot = json['hot'];
    autoPass = json['autoPass'];
    originalUrl = json['originalUrl'];
    verifyCreatedAt = json['verifyCreatedAt'];
    createdAt = json['createdAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    author = json['author'];
    screenshot = json['screenshot'];
    original = json['original'];
    hotIndex = json['hotIndex'];
    content = json['content'];
    title = json['title'];
    lastCommentTime = json['lastCommentTime'];
    type = json['type'];
    english = json['english'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    viewsCount = json['viewsCount'];
    summaryInfo = json['summaryInfo'];
    isCollected = json['isCollected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collectionCount'] = this.collectionCount;
    data['userRankIndex'] = this.userRankIndex;
    data['buildTime'] = this.buildTime;
    data['commentsCount'] = this.commentsCount;
    data['gfw'] = this.gfw;
    data['objectId'] = this.objectId;
    data['checkStatus'] = this.checkStatus;
    data['isEvent'] = this.isEvent;
    data['entryView'] = this.entryView;
    data['subscribersCount'] = this.subscribersCount;
    data['ngxCachedTime'] = this.ngxCachedTime;
    data['verifyStatus'] = this.verifyStatus;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = this.updatedAt;
    data['rankIndex'] = this.rankIndex;
    data['hot'] = this.hot;
    data['autoPass'] = this.autoPass;
    data['originalUrl'] = this.originalUrl;
    data['verifyCreatedAt'] = this.verifyCreatedAt;
    data['createdAt'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['author'] = this.author;
    data['screenshot'] = this.screenshot;
    data['original'] = this.original;
    data['hotIndex'] = this.hotIndex;
    data['content'] = this.content;
    data['title'] = this.title;
    data['lastCommentTime'] = this.lastCommentTime;
    data['type'] = this.type;
    data['english'] = this.english;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['viewsCount'] = this.viewsCount;
    data['summaryInfo'] = this.summaryInfo;
    data['isCollected'] = this.isCollected;
    return data;
  }
}

class Tags {
  dynamic ngxCachedTime;
  bool ngxCached;
  String title;
  String id;

  Tags({this.ngxCachedTime, this.ngxCached, this.title, this.id});

  Tags.fromJson(Map<String, dynamic> json) {
    ngxCachedTime = json['ngxCachedTime'];
    ngxCached = json['ngxCached'];
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ngxCachedTime'] = this.ngxCachedTime;
    data['ngxCached'] = this.ngxCached;
    data['title'] = this.title;
    data['id'] = this.id;
    return data;
  }
}

class User {
  Community community;
  int collectedEntriesCount;
  String company;
  int followersCount;
  int followeesCount;
  String role;
  int postedPostsCount;
  int level;
  bool isAuthor;
  int postedEntriesCount;
  int totalCommentsCount;
  int ngxCachedTime;
  bool ngxCached;
  int viewedEntriesCount;
  String jobTitle;
  int subscribedTagsCount;
  int totalCollectionsCount;
  String username;
  String avatarLarge;
  String objectId;

  User(
      {this.community,
      this.collectedEntriesCount,
      this.company,
      this.followersCount,
      this.followeesCount,
      this.role,
      this.postedPostsCount,
      this.level,
      this.isAuthor,
      this.postedEntriesCount,
      this.totalCommentsCount,
      this.ngxCachedTime,
      this.ngxCached,
      this.viewedEntriesCount,
      this.jobTitle,
      this.subscribedTagsCount,
      this.totalCollectionsCount,
      this.username,
      this.avatarLarge,
      this.objectId});

  User.fromJson(Map<String, dynamic> json) {
    community = json['community'] != null
        ? new Community.fromJson(json['community'])
        : null;
    collectedEntriesCount = json['collectedEntriesCount'];
    company = json['company'];
    followersCount = json['followersCount'];
    followeesCount = json['followeesCount'];
    role = json['role'];
    postedPostsCount = json['postedPostsCount'];
    level = json['level'];
    isAuthor = json['isAuthor'];
    postedEntriesCount = json['postedEntriesCount'];
    totalCommentsCount = json['totalCommentsCount'];
    ngxCachedTime = json['ngxCachedTime'];
    ngxCached = json['ngxCached'];
    viewedEntriesCount = json['viewedEntriesCount'];
    jobTitle = json['jobTitle'];
    subscribedTagsCount = json['subscribedTagsCount'];
    totalCollectionsCount = json['totalCollectionsCount'];
    username = json['username'];
    avatarLarge = json['avatarLarge'];
    objectId = json['objectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.community != null) {
      data['community'] = this.community.toJson();
    }
    data['collectedEntriesCount'] = this.collectedEntriesCount;
    data['company'] = this.company;
    data['followersCount'] = this.followersCount;
    data['followeesCount'] = this.followeesCount;
    data['role'] = this.role;
    data['postedPostsCount'] = this.postedPostsCount;
    data['level'] = this.level;
    data['isAuthor'] = this.isAuthor;
    data['postedEntriesCount'] = this.postedEntriesCount;
    data['totalCommentsCount'] = this.totalCommentsCount;
    data['ngxCachedTime'] = this.ngxCachedTime;
    data['ngxCached'] = this.ngxCached;
    data['viewedEntriesCount'] = this.viewedEntriesCount;
    data['jobTitle'] = this.jobTitle;
    data['subscribedTagsCount'] = this.subscribedTagsCount;
    data['totalCollectionsCount'] = this.totalCollectionsCount;
    data['username'] = this.username;
    data['avatarLarge'] = this.avatarLarge;
    data['objectId'] = this.objectId;
    return data;
  }
}

class Community {
  Wechat wechat;
  Github github;
  Weibo weibo;

  Community({this.wechat, this.github, this.weibo});

  Community.fromJson(Map<String, dynamic> json) {
    wechat =
        json['wechat'] != null ? new Wechat.fromJson(json['wechat']) : null;
    github =
        json['github'] != null ? new Github.fromJson(json['github']) : null;
    weibo = json['weibo'] != null ? new Weibo.fromJson(json['weibo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wechat != null) {
      data['wechat'] = this.wechat.toJson();
    }
    if (this.github != null) {
      data['github'] = this.github.toJson();
    }
    if (this.weibo != null) {
      data['weibo'] = this.weibo.toJson();
    }
    return data;
  }
}

class Wechat {
  String avatarLarge;

  Wechat({this.avatarLarge});

  Wechat.fromJson(Map<String, dynamic> json) {
    avatarLarge = json['avatarLarge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarLarge'] = this.avatarLarge;
    return data;
  }
}

class Github {
  String username;
  String avatarLarge;
  String uid;

  Github({this.username, this.avatarLarge, this.uid});

  Github.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    avatarLarge = json['avatarLarge'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['avatarLarge'] = this.avatarLarge;
    data['uid'] = this.uid;
    return data;
  }
}

class Weibo {
  String selfDescription;
  String uid;
  String blogAddress;
  String username;
  String avatarLarge;

  Weibo(
      {this.selfDescription,
      this.uid,
      this.blogAddress,
      this.username,
      this.avatarLarge});

  Weibo.fromJson(Map<String, dynamic> json) {
    selfDescription = json['selfDescription'];
    uid = json['uid'];
    blogAddress = json['blogAddress'];
    username = json['username'];
    avatarLarge = json['avatarLarge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selfDescription'] = this.selfDescription;
    data['uid'] = this.uid;
    data['blogAddress'] = this.blogAddress;
    data['username'] = this.username;
    data['avatarLarge'] = this.avatarLarge;
    return data;
  }
}

class Category {
  bool ngxCached;
  String title;
  String id;
  String name;
  int ngxCachedTime;

  Category(
      {this.ngxCached, this.title, this.id, this.name, this.ngxCachedTime});

  Category.fromJson(Map<String, dynamic> json) {
    ngxCached = json['ngxCached'];
    title = json['title'];
    id = json['id'];
    name = json['name'];
    ngxCachedTime = json['ngxCachedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ngxCached'] = this.ngxCached;
    data['title'] = this.title;
    data['id'] = this.id;
    data['name'] = this.name;
    data['ngxCachedTime'] = this.ngxCachedTime;
    return data;
  }
}