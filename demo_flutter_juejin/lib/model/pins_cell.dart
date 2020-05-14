class PinsCell {
  int s;
  String m;
  D d;

  PinsCell({this.s, this.m, this.d});

  PinsCell.fromJson(Map<String, dynamic> json) {
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
  List<UnitList> list;

  D({this.total, this.list});

  D.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      list = new List<UnitList>();
      json['list'].forEach((v) {
        list.add(new UnitList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnitList {
  String objectId;
  String uid;
  User user;
  String content;
  List<String> pictures;
  String url;
  String urlTitle;
  String urlPic;
  int commentCount;
  int likedCount;
  bool isLiked;
  String createdAt;
  String updatedAt;
  String topicId;
  Topic topic;
  bool isTopicRecommend;
  bool folded;

  UnitList(
      {this.objectId,
      this.uid,
      this.user,
      this.content,
      this.pictures,
      this.url,
      this.urlTitle,
      this.urlPic,
      this.commentCount,
      this.likedCount,
      this.isLiked,
      this.createdAt,
      this.updatedAt,
      this.topicId,
      this.topic,
      this.isTopicRecommend,
      this.folded});

  UnitList.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    uid = json['uid'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    content = json['content'];
    pictures = json['pictures'].cast<String>();
    url = json['url'];
    urlTitle = json['urlTitle'];
    urlPic = json['urlPic'];
    commentCount = json['commentCount'];
    likedCount = json['likedCount'];
    isLiked = json['isLiked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    topicId = json['topicId'];
    topic = json['topic'] != null ? new Topic.fromJson(json['topic']) : null;
    isTopicRecommend = json['isTopicRecommend'];
    folded = json['folded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['uid'] = this.uid;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['content'] = this.content;
    data['pictures'] = this.pictures;
    data['url'] = this.url;
    data['urlTitle'] = this.urlTitle;
    data['urlPic'] = this.urlPic;
    data['commentCount'] = this.commentCount;
    data['likedCount'] = this.likedCount;
    data['isLiked'] = this.isLiked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['topicId'] = this.topicId;
    if (this.topic != null) {
      data['topic'] = this.topic.toJson();
    }
    data['isTopicRecommend'] = this.isTopicRecommend;
    data['folded'] = this.folded;
    return data;
  }
}

class User {
  String avatarLarge;
  String objectId;
  String company;
  int followeesCount;
  int followersCount;
  String jobTitle;
  String role;
  String username;
  int level;
  bool currentUserFollowed;

  User(
      {this.avatarLarge,
      this.objectId,
      this.company,
      this.followeesCount,
      this.followersCount,
      this.jobTitle,
      this.role,
      this.username,
      this.level,
      this.currentUserFollowed});

  User.fromJson(Map<String, dynamic> json) {
    avatarLarge = json['avatarLarge'];
    objectId = json['objectId'];
    company = json['company'];
    followeesCount = json['followeesCount'];
    followersCount = json['followersCount'];
    jobTitle = json['jobTitle'];
    role = json['role'];
    username = json['username'];
    level = json['level'];
    currentUserFollowed = json['currentUserFollowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarLarge'] = this.avatarLarge;
    data['objectId'] = this.objectId;
    data['company'] = this.company;
    data['followeesCount'] = this.followeesCount;
    data['followersCount'] = this.followersCount;
    data['jobTitle'] = this.jobTitle;
    data['role'] = this.role;
    data['username'] = this.username;
    data['level'] = this.level;
    data['currentUserFollowed'] = this.currentUserFollowed;
    return data;
  }
}

class Topic {
  String objectId;
  String title;
  String description;
  String icon;
  int msgsCount;
  int followersCount;
  int attendersCount;
  int hotIndex;
  String createdAt;
  String updatedAt;
  String latestMsgCreatedAt;

  Topic(
      {this.objectId,
      this.title,
      this.description,
      this.icon,
      this.msgsCount,
      this.followersCount,
      this.attendersCount,
      this.hotIndex,
      this.createdAt,
      this.updatedAt,
      this.latestMsgCreatedAt});

  Topic.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
    msgsCount = json['msgsCount'];
    followersCount = json['followersCount'];
    attendersCount = json['attendersCount'];
    hotIndex = json['hotIndex'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    latestMsgCreatedAt = json['latestMsgCreatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['msgsCount'] = this.msgsCount;
    data['followersCount'] = this.followersCount;
    data['attendersCount'] = this.attendersCount;
    data['hotIndex'] = this.hotIndex;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['latestMsgCreatedAt'] = this.latestMsgCreatedAt;
    return data;
  }
}