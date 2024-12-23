import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable(explicitToJson: true)
class Topic extends Equatable {
  final int id;
  final String name;

  const Topic({
    required this.id,
    required this.name,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);

  @override
  String toString() {
    return '{id: $id, name: $name}';
  }

  @override
  List<Object?> get props => [id, name];
}
