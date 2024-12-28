// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: (json['id'] as num).toInt(),
      body: json['body'] as String,
      postId: (json['postId'] as num).toInt(),
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: DateTimeHelper.sqlTimeToMilliseconds(
          (json['createdAt'] as num).toInt()),
      updatedAt: DateTimeHelper.sqlTimeToMilliseconds(
          (json['updatedAt'] as num).toInt()),
      parentId: (json['parentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'postId': instance.postId,
      'parentId': instance.parentId,
      'author': instance.author.toJson(),
      'createdAt': DateTimeHelper.millisecondsToSqlTime(instance.createdAt),
      'updatedAt': DateTimeHelper.millisecondsToSqlTime(instance.updatedAt),
    };

NewComment _$NewCommentFromJson(Map<String, dynamic> json) => NewComment(
      body: json['body'] as String,
      postId: (json['postId'] as num).toInt(),
      authorId: (json['authorId'] as num).toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NewCommentToJson(NewComment instance) =>
    <String, dynamic>{
      'body': instance.body,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'parentId': instance.parentId,
    };
