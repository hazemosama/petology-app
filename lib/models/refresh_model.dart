class RefreshModel {
  RefreshModel({
    required this.access,
  });
  late final String access;

  RefreshModel.fromJson(Map<String, dynamic> json){
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access'] = access;
    return _data;
  }
}