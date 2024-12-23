import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:minbaro_app/helpers/date_time_helper.dart';

import 'package:minbaro_app/models/models.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post extends Equatable {
  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.author,
    required this.topic,
    required this.createdAt,
    required this.updatedAt,
    required this.commentCount,
  });

  final int id;
  final String title;
  final String body;
  final Author author;
  final Topic topic;
  @JsonKey(
      name: 'created_at',
      fromJson: DateTimeHelper.sqlTimeToMilliseconds,
      toJson: DateTimeHelper.millisecondsToSqlTime)
  final int createdAt;
  @JsonKey(
      name: 'updated_at',
      fromJson: DateTimeHelper.sqlTimeToMilliseconds,
      toJson: DateTimeHelper.millisecondsToSqlTime)
  final int updatedAt;
  @JsonKey(name: 'comment_count', defaultValue: 0)
  final int commentCount;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return '{id: $id, title: $title, body: $body, author: $author, topic: $topic, createdAt: $createdAt, updatedAt: $updatedAt, commentCount: $commentCount}';
  }

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        author,
        topic,
        createdAt,
        updatedAt,
        commentCount,
      ];
}
