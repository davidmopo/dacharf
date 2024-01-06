class PostListUserResp {
  String? status;
  String? message;
  Data? data;

  PostListUserResp({this.status, this.message, this.data});

  PostListUserResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  List<DataItem>? data;
  Paginator? paginator;

  Data({this.data, this.paginator});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataItem>[];
      json['data'].forEach((v) {
        data?.add(DataItem.fromJson(v));
      });
    }
    paginator = json['paginator'] != null
        ? Paginator.fromJson(json['paginator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (paginator != null) {
      data['paginator'] = paginator?.toJson();
    }
    return data;
  }
}

class DataItem {
  int? loginRetryLimit;
  String? password;
  String? email;
  int? role;
  String? createdAt;
  String? updatedAt;
  bool? isDeleted;
  bool? isActive;
  String? id;

  DataItem(
      {this.loginRetryLimit,
      this.password,
      this.email,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.isDeleted,
      this.isActive,
      this.id});

  DataItem.fromJson(Map<String, dynamic> json) {
    loginRetryLimit = json['loginRetryLimit'];
    password = json['password'];
    email = json['email'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (loginRetryLimit != null) {
      data['loginRetryLimit'] = loginRetryLimit;
    }
    if (password != null) {
      data['password'] = password;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (role != null) {
      data['role'] = role;
    }
    if (createdAt != null) {
      data['createdAt'] = createdAt;
    }
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt;
    }
    if (isDeleted != null) {
      data['isDeleted'] = isDeleted;
    }
    if (isActive != null) {
      data['isActive'] = isActive;
    }
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}

class Paginator {
  int? itemCount;
  int? perPage;
  int? pageCount;
  int? currentPage;
  int? slNo;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prev;
  dynamic next;

  Paginator(
      {this.itemCount,
      this.perPage,
      this.pageCount,
      this.currentPage,
      this.slNo,
      this.hasPrevPage,
      this.hasNextPage,
      this.prev,
      this.next});

  Paginator.fromJson(Map<String, dynamic> json) {
    itemCount = json['itemCount'];
    perPage = json['perPage'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
    slNo = json['slNo'];
    hasPrevPage = json['hasPrevPage'];
    hasNextPage = json['hasNextPage'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (itemCount != null) {
      data['itemCount'] = itemCount;
    }
    if (perPage != null) {
      data['perPage'] = perPage;
    }
    if (pageCount != null) {
      data['pageCount'] = pageCount;
    }
    if (currentPage != null) {
      data['currentPage'] = currentPage;
    }
    if (slNo != null) {
      data['slNo'] = slNo;
    }
    if (hasPrevPage != null) {
      data['hasPrevPage'] = hasPrevPage;
    }
    if (hasNextPage != null) {
      data['hasNextPage'] = hasNextPage;
    }
    if (prev != null) {
      data['prev'] = prev;
    }
    if (next != null) {
      data['next'] = next;
    }
    return data;
  }
}
