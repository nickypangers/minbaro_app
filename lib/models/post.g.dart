// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      topic: Topic.fromJson(json['topic'] as Map<String, dynamic>),
      createdAt: DateTimeHelper.sqlTimeToMilliseconds(
          (json['created_at'] as num).toInt()),
      updatedAt: DateTimeHelper.sqlTimeToMilliseconds(
          (json['updated_at'] as num).toInt()),
      commentCount: (json['comment_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'author': instance.author.toJson(),
      'topic': instance.topic.toJson(),
      'created_at': DateTimeHelper.millisecondsToSqlTime(instance.createdAt),
      'updated_at': DateTimeHelper.millisecondsToSqlTime(instance.updatedAt),
      'comment_count': instance.commentCount,
    };
