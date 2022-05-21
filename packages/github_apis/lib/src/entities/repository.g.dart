// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) => Repository(
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      private: json['private'] as bool?,
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      htmlUrl: json['html_url'] as String?,
      description: json['description'] as String?,
      stargazersUrl: json['stargazers_url'] as String?,
      stargazersCount: json['stargazers_count'] as int?,
      watchers: json['watchers'] as int?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'stargazers_url': instance.stargazersUrl,
      'stargazers_count': instance.stargazersCount,
      'watchers': instance.watchers,
      'language': instance.language,
    };
