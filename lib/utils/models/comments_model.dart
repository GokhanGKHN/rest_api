class CommentsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsModel({this.postId, this.id, this.name, this.email, this.body});
  //fromJson nesne oluşturuyor
  CommentsModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
  //toJson Nesneden JSON'a Dönüşüm
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
