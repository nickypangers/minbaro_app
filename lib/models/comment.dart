import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:minbaro_app/helpers/date_time_helper.dart';
import 'package:minbaro_app/models/models.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment extends Equatable {
  Comment({
    required this.id,
    required this.body,
    required this.postId,
    required this.author,
    required this.createdAt,
    required this.updatedAt,
    this.parentId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  final int id;
  final String body;
  final int postId;
  final int? parentId;
  final Author author;
  @JsonKey(
      fromJson: DateTimeHelper.sqlTimeToMilliseconds,
      toJson: DateTimeHelper.millisecondsToSqlTime)
  final int createdAt;
  @JsonKey(
      fromJson: DateTimeHelper.sqlTimeToMilliseconds,
      toJson: DateTimeHelper.millisecondsToSqlTime)
  final int updatedAt;

  List<Comment> _children = [];

  List<Comment> get children => _children;

  void addChildren(List<Comment> children) {
    _children = children;
  }

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  @override
  String toString() {
    return '{id: $id, body: $body, postId: $postId, parentId: $parentId, author: $author, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  @override
  List<Object?> get props =>
      [id, body, postId, parentId, author, createdAt, updatedAt];
}

@JsonSerializable()
class NewComment extends Equatable {
  const NewComment({
    required this.body,
    required this.postId,
    required this.authorId,
    this.parentId,
  });

  factory NewComment.fromJson(Map<String, dynamic> json) =>
      _$NewCommentFromJson(json);

  final String body;
  final int postId;
  final int authorId;
  final int? parentId;

  Map<String, dynamic> toJson() => _$NewCommentToJson(this);

  @override
  List<Object?> get props => [body, postId, authorId, parentId];
}
