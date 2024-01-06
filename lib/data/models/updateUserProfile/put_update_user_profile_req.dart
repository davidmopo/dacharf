class PutUpdateUserProfileReq {
  String? name;

  PutUpdateUserProfileReq({this.name});

  PutUpdateUserProfileReq.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name;
    }
    return data;
  }
}
