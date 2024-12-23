import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable(explicitToJson: true)
class Author extends Equatable {
  final int id;
  final String username;

  const Author({
    required this.id,
    required this.username,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  @override
  String toString() {
    return '{id: $id, username: $username}';
  }

  @override
  List<Object?> get props => [id, username];
}
