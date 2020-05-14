class BookNav {
  int s;
  String m;
  List<BookNavDetail> bookNavList;

  BookNav({this.s, this.m, this.bookNavList});

  BookNav.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    m = json['m'];
    if (json['d'] != null) {
      bookNavList = new List<BookNavDetail>();
      json['d'].forEach((v) {
        bookNavList.add(new BookNavDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['m'] = this.m;
    if (this.bookNavList != null) {
      data['d'] = this.bookNavList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookNavDetail {
  String id;
  String name;
  String score;
  String createdAt;
  String alias;

  BookNavDetail({this.id, this.name, this.score, this.createdAt, this.alias});

  BookNavDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
    createdAt = json['createdAt'];
    alias = json['alias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    data['createdAt'] = this.createdAt;
    data['alias'] = this.alias;
    return data;
  }
}