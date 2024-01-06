class PostListUserReq {
  Options? options;

  PostListUserReq({this.options});

  PostListUserReq.fromJson(Map<String, dynamic> json) {
    options =
        json['options'] != null ? Options.fromJson(json['options']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (options != null) {
      data['options'] = options?.toJson();
    }
    return data;
  }
}

class Options {
  int? page;
  int? limit;

  Options({this.page, this.limit});

  Options.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (page != null) {
      data['page'] = page;
    }
    if (limit != null) {
      data['limit'] = limit;
    }
    return data;
  }
}
