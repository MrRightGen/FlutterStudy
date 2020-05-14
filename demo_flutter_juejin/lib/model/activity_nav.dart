class ActivityNav {
  int s;
  String m;
  List<CityInfo> d;

  ActivityNav({this.s, this.m, this.d});

  ActivityNav.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    m = json['m'];
    if (json['d'] != null) {
      d = new List<CityInfo>();
      json['d'].forEach((v) {
        d.add(new CityInfo.fromJson(v));
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

class CityInfo {
  String cityName;
  String cityAlias;
  int weight;

  CityInfo({this.cityName, this.cityAlias, this.weight});

  CityInfo.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    cityAlias = json['cityAlias'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityName'] = this.cityName;
    data['cityAlias'] = this.cityAlias;
    data['weight'] = this.weight;
    return data;
  }
}