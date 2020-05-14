class BookCell {
  dynamic s;
  String m;
  List<BookCellDetail> bookCellList;

  BookCell({this.s, this.m, this.bookCellList});

  BookCell.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    m = json['m'];
    
    if (json['d'] != null) {
      bookCellList = new List<BookCellDetail>();
      json['d'].forEach((v) {
        bookCellList.add(new BookCellDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['m'] = this.m;
    if (this.bookCellList != null) {
      data['d'] = this.bookCellList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookCellDetail {
  String sId;
  List<String> section;
  String desc;
  String user;
  dynamic price;
  String title;
  dynamic buyCount;
  dynamic viewCount;
  dynamic contentSize;
  String img;
  String category;
  List<String> tags;
  String createdAt;
  String updatedAt;
  String finishedAt;
  bool isFinished;
  bool isDeleted;
  bool isHot;
  dynamic isPublish;
  bool isShow;
  String profile;
  dynamic lastSectionCount;
  dynamic pv;
  List<String> navId;
  String wechatSignal;
  String wechatImg;
  String wechatImgDesc;
  String url;
  bool isTop;
  bool isEditor;
  bool isBuy;
  ReadLog readLog;
  UserData userData;
  String cid;

  BookCellDetail(
      {this.sId,
      this.section,
      this.desc,
      this.user,
      this.price,
      this.title,
      this.buyCount,
      this.viewCount,
      this.contentSize,
      this.img,
      this.category,
      this.tags,
      this.createdAt,
      this.updatedAt,
      this.finishedAt,
      this.isFinished,
      this.isDeleted,
      this.isHot,
      this.isPublish,
      this.isShow,
      this.profile,
      this.lastSectionCount,
      this.pv,
      this.navId,
      this.wechatSignal,
      this.wechatImg,
      this.wechatImgDesc,
      this.url,
      this.isTop,
      this.isEditor,
      this.isBuy,
      this.readLog,
      this.userData,
      this.cid});

  BookCellDetail.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    section = json['section'].cast<String>();
    desc = json['desc'];
    user = json['user'];
    price = json['price'];
    title = json['title'];
    buyCount = json['buyCount'];
    viewCount = json['viewCount'];
    contentSize = json['contentSize'];
    img = json['img'];
    category = json['category'];
    tags = json['tags'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    finishedAt = json['finishedAt'];
    isFinished = json['isFinished'];
    isDeleted = json['isDeleted'];
    isHot = json['isHot'];
    isPublish = json['isPublish'];
    isShow = json['isShow'];
    profile = json['profile'];
    lastSectionCount = json['lastSectionCount'];
    pv = json['pv'];
    navId = json['navId']?.cast<String>();
    wechatSignal = json['wechatSignal'];
    wechatImg = json['wechatImg'];
    wechatImgDesc = json['wechatImgDesc'];
    url = json['url'];
    isTop = json['isTop'];
    isEditor = json['isEditor'];
    isBuy = json['isBuy'];
    readLog =
        json['readLog'] != null ? new ReadLog.fromJson(json['readLog']) : null; 
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
    cid = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['section'] = this.section;
    data['desc'] = this.desc;
    data['user'] = this.user;
    data['price'] = this.price;
    data['title'] = this.title;
    data['buyCount'] = this.buyCount;
    data['viewCount'] = this.viewCount;
    data['contentSize'] = this.contentSize;
    data['img'] = this.img;
    data['category'] = this.category;
    data['tags'] = this.tags;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['finishedAt'] = this.finishedAt;
    data['isFinished'] = this.isFinished;
    data['isDeleted'] = this.isDeleted;
    data['isHot'] = this.isHot;
    data['isPublish'] = this.isPublish;
    data['isShow'] = this.isShow;
    data['profile'] = this.profile;
    data['lastSectionCount'] = this.lastSectionCount;
    data['pv'] = this.pv;
    data['navId'] = this.navId;
    data['wechatSignal'] = this.wechatSignal;
    data['wechatImg'] = this.wechatImg;
    data['wechatImgDesc'] = this.wechatImgDesc;
    data['url'] = this.url;
    data['isTop'] = this.isTop;
    data['isEditor'] = this.isEditor;
    data['isBuy'] = this.isBuy;
    if (this.readLog != null) {
      data['readLog'] = this.readLog.toJson();
    }
    if (this.userData != null) {
      data['userData'] = this.userData.toJson();
    }
    data['id'] = this.cid;
    return data;
  }
}

class ReadLog {
  String sectionId;
  String sign;

  ReadLog({this.sectionId, this.sign});

  ReadLog.fromJson(Map<String, dynamic> json) {
    sectionId = json['sectionId'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionId'] = this.sectionId;
    data['sign'] = this.sign;
    return data;
  }
}

class UserData {
  String role;
  String username;
  String selfDescription;
  String jobTitle;
  String company;
  String avatarHd;
  String avatarLarge;
  dynamic mobilePhoneVerified; //
  dynamic isAuthor; //
  String isXiaoceAuthor;
  dynamic bookletCount;
  String objectId;
  String uid;
  dynamic level; //

  UserData(
      {this.role,
      this.username,
      this.selfDescription,
      this.jobTitle,
      this.company,
      this.avatarHd,
      this.avatarLarge,
      this.mobilePhoneVerified,
      this.isAuthor,
      this.isXiaoceAuthor,
      this.bookletCount,
      this.objectId,
      this.uid,
      this.level});

  UserData.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    username = json['username'];
    selfDescription = json['selfDescription'];
    jobTitle = json['jobTitle'];
    company = json['company'];
    avatarHd = json['avatarHd'];
    avatarLarge = json['avatarLarge'];
    mobilePhoneVerified = json['mobilePhoneVerified'];
    isAuthor = json['isAuthor'];
    isXiaoceAuthor = json['isXiaoceAuthor'];
    bookletCount = json['bookletCount'];
    objectId = json['objectId'];
    uid = json['uid'];
    level = (json['level'] == '' || json['level'] == null) ? "0" : json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['username'] = this.username;
    data['selfDescription'] = this.selfDescription;
    data['jobTitle'] = this.jobTitle;
    data['company'] = this.company;
    data['avatarHd'] = this.avatarHd;
    data['avatarLarge'] = this.avatarLarge;
    data['mobilePhoneVerified'] = this.mobilePhoneVerified;
    data['isAuthor'] = this.isAuthor;
    data['isXiaoceAuthor'] = this.isXiaoceAuthor;
    data['bookletCount'] = this.bookletCount;
    data['objectId'] = this.objectId;
    data['uid'] = this.uid;
    data['level'] = this.level;
    return data;
  }
}