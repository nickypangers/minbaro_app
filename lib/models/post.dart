import 'package:freezed_annotation/freezed_annotation.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
sealed class Post with _$Post {
  const factory Post({
    required int id,
    required String title,
    required String body,
    @Default('topic') String topic,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
