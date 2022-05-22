import 'package:github_apis/src/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {
  final int? id;
  @JsonKey(name: "node_id")
  final String? nodeId;
  final String? name;
  @JsonKey(name: "full_name")
  final String? fullName;
  final bool? private;
  final User? owner;
  @JsonKey(name: "html_url")
  final String? htmlUrl;
  final String? description;
  @JsonKey(name: "stargazers_url")
  final String? stargazersUrl;
  @JsonKey(name: "stargazers_count")
  final int? stargazersCount;
  final int? watchers;
  final String? language;

  Repository({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.description,
    required this.stargazersUrl,
    required this.stargazersCount,
    required this.watchers,
    required this.language,
  });

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}
