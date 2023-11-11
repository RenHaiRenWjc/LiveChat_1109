import 'dart:ffi';

/// admin : false
/// email : "“112@163.com”"
/// icon : "“111”"
/// id : 138983
/// nickname : "”jcchen“"
/// password : "“11”"
/// publicName : "”jcchen“"
/// token : "”11“"
/// type : 0
/// username : "”jcchen“"
/// chapterTops : ["“1”，“1”"]
/// coinCount : 21
/// collectIds : ["“1”，“1”"]

class UserInfo {
  UserInfo({
    bool? admin,
    String? email,
    String? icon,
    Long? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    int? type,
    String? username,
    List<String>? chapterTops,
    int? coinCount,
    List<String>? collectIds,
  }) {
    _admin = admin;
    _email = email;
    _icon = icon;
    _id = id;
    _nickname = nickname;
    _password = password;
    _publicName = publicName;
    _token = token;
    _type = type;
    _username = username;
    _chapterTops = chapterTops;
    _coinCount = coinCount;
    _collectIds = collectIds;
  }

  UserInfo.fromJson(dynamic json) {
    _admin = json['admin'];
    _email = json['email'];
    _icon = json['icon'];
    _id = json['id'];
    _nickname = json['nickname'];
    _password = json['password'];
    _publicName = json['publicName'];
    _token = json['token'];
    _type = json['type'];
    _username = json['username'];
    _chapterTops = json['chapterTops'] != null ? json['chapterTops'].cast<String>() : [];
    _coinCount = json['coinCount'];
    _collectIds = json['collectIds'] != null ? json['collectIds'].cast<String>() : [];
  }

  bool? _admin;
  String? _email;
  String? _icon;
  Long? _id;
  String? _nickname;
  String? _password;
  String? _publicName;
  String? _token;
  int? _type;
  String? _username;
  List<String>? _chapterTops;
  int? _coinCount;
  List<String>? _collectIds;

  UserInfo copyWith({
    bool? admin,
    String? email,
    String? icon,
    Long? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    int? type,
    String? username,
    List<String>? chapterTops,
    int? coinCount,
    List<String>? collectIds,
  }) =>
      UserInfo(
        admin: admin ?? _admin,
        email: email ?? _email,
        icon: icon ?? _icon,
        id: id,
        nickname: nickname ?? _nickname,
        password: password ?? _password,
        publicName: publicName ?? _publicName,
        token: token ?? _token,
        type: type ?? _type,
        username: username ?? _username,
        chapterTops: chapterTops ?? _chapterTops,
        coinCount: coinCount ?? _coinCount,
        collectIds: collectIds ?? _collectIds,
      );

  bool? get admin => _admin;

  String? get email => _email;

  String? get icon => _icon;

  Long? get id => _id;

  String? get nickname => _nickname;

  String? get password => _password;

  String? get publicName => _publicName;

  String? get token => _token;

  int? get type => _type;

  String? get username => _username;

  List<String>? get chapterTops => _chapterTops;

  int? get coinCount => _coinCount;

  List<String>? get collectIds => _collectIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = _admin;
    map['email'] = _email;
    map['icon'] = _icon;
    map['id'] = _id;
    map['nickname'] = _nickname;
    map['password'] = _password;
    map['publicName'] = _publicName;
    map['token'] = _token;
    map['type'] = _type;
    map['username'] = _username;
    map['chapterTops'] = _chapterTops;
    map['coinCount'] = _coinCount;
    map['collectIds'] = _collectIds;
    return map;
  }
}
