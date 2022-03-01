class Post {
  String? title;
  String? body;

  Post({this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json['title'],
        body: json['body'],
      );
}
