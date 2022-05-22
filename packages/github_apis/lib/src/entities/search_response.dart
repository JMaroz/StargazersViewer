import 'package:github_apis/src/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  final int? totalCount;
  final bool? incompleteResults;
  final List<User>? items;

  SearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
