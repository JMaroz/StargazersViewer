// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      totalCount: json['totalCount'] as int?,
      incompleteResults: json['incompleteResults'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'incompleteResults': instance.incompleteResults,
      'items': instance.items,
    };
