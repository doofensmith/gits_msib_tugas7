import 'dart:convert';

Post postFromJson(String string) {
  return Post.fromJson(json.decode(string));
}

String postToJson(Post post) {
  return json.encode(post.toJson());
}

class Post {
  int? id;
  Object? title;
  Object? content;

  Post({
    this.id,
    this.title,
    this.content,
  });

  factory Post.fromJson(String str) {
    return Post.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"]["rendered"],
        content: json["content"]["rendered"],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
    };
  }
}

// class PostTitle {
//   String? rendered;

//   PostTitle({
//     this.rendered,
//   });

//   factory PostTitle.fromJson(Map<String, dynamic> json) {
//     return PostTitle(
//       rendered: json['rendered'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'rendered': rendered,
//     };
//   }
// }

// class PostContent {
//   String? rendered;

//   PostContent({
//     this.rendered,
//   });

//   factory PostContent.fromJson(Map<String, dynamic> json) {
//     return PostContent(
//       rendered: json['rendered'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'rendered': rendered,
//     };
//   }
// }
