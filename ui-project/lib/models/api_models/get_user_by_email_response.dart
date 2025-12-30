
class GetUserByEmailResponse {
  int? recordCount;
  int? statusId;
  String? message;
  List<GetUserByEmail>? resbody;

  GetUserByEmailResponse.fromJson(Map<String, dynamic> json) {
    recordCount = json['recordCount'];
    statusId = json['statusId'];
    message = json['message'];
    if (json['resbody'] != null) {
      resbody = <GetUserByEmail>[];
      json['resbody'].forEach((v) {
        resbody!.add(GetUserByEmail.fromJson(v));
      });
    }
  }
}


class GetUserByEmail {
  int? id;
  String? googleId;
  String? email;
  String? name;
  String? avatarUrl;
  String? createdAt;

  GetUserByEmail({
    this.id,
    required this.googleId,
    required this.email,
    required this.name,
    required this.avatarUrl,
  });

  GetUserByEmail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    googleId = json['google_id'];
    email = json['email'];
    name = json['name'];
    avatarUrl = json['avatar_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['google_id'] = googleId;
    data['email'] = email;
    data['name'] = name;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}
