// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] as int?,
      source: json['source'] as String?,
      publishedDate: json['publishedDate'] == null
          ? null
          : DateTime.parse(json['publishedDate'] as String),
      section: json['section'] as String?,
      byline: json['byline'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      articleModelAbstract: json['articleModelAbstract'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'publishedDate': instance.publishedDate?.toIso8601String(),
      'section': instance.section,
      'byline': instance.byline,
      'type': instance.type,
      'title': instance.title,
      'articleModelAbstract': instance.articleModelAbstract,
      'media': instance.media,
    };
