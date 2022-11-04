// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';
import 'package:dafallah_nyt/features/articles/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';
part 'article_model.g.dart';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

@JsonSerializable()
class ArticleModel extends Article {
  const ArticleModel({
    int? id,
    String? source,
    DateTime? publishedDate,
    String? section,
    String? byline,
    String? type,
    String? title,
    String? articleModelAbstract,
    List<Media>? media,
  }) : super(
          id: id,
          source: source,
          publishedDate: publishedDate,
          section: section,
          byline: byline,
          type: type,
          title: title,
          articleModelAbstract: articleModelAbstract,
          media: media,
        );
  ArticleModel copyWith({
    int? id,
    String? source,
    DateTime? publishedDate,
    String? section,
    String? byline,
    String? type,
    String? title,
    String? articleModelAbstract,
    List<Media>? media,
  }) =>
      ArticleModel(
        id: id ?? this.id,
        source: source ?? this.source,
        publishedDate: publishedDate ?? this.publishedDate,
        section: section ?? this.section,
        byline: byline ?? this.byline,
        type: type ?? this.type,
        title: title ?? this.title,
        articleModelAbstract: articleModelAbstract ?? this.articleModelAbstract,
        media: media ?? this.media,
      );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        source: json["source"],
        publishedDate: json["published_date"] == null ? null :  DateTime.parse(json["published_date"]),
        section: json["section"],
        byline: json["byline"],
        type: json["type"],
        title: json["title"],
        articleModelAbstract: json["abstract"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "source": source,
        "published_date":
            "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "section": section,
        "byline": byline,
        "type": type,
        "title": title,
        "abstract": articleModelAbstract,
        "media": List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadatum>? mediaMetadata;

  Media copyWith({
    String? type,
    String? subtype,
    String? caption,
    String? copyright,
    int? approvedForSyndication,
    List<MediaMetadatum>? mediaMetadata,
  }) =>
      Media(
        type: type ?? this.type,
        subtype: subtype ?? this.subtype,
        caption: caption ?? this.caption,
        copyright: copyright ?? this.copyright,
        approvedForSyndication:
            approvedForSyndication ?? this.approvedForSyndication,
        mediaMetadata: mediaMetadata ?? this.mediaMetadata,
      );

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json["type"],
        subtype: json["subtype"],
        caption: json["caption"],
        copyright: json["copyright"],
        approvedForSyndication: json["approved_for_syndication"],
        mediaMetadata: List<MediaMetadatum>.from(
            json["media-metadata"].map((x) => MediaMetadatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
        "approved_for_syndication": approvedForSyndication,
        "media-metadata":
            List<dynamic>.from(mediaMetadata!.map((x) => x.toJson())),
      };
}

class MediaMetadatum {
  MediaMetadatum({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadatum copyWith({
    String? url,
    String? format,
    int? height,
    int? width,
  }) =>
      MediaMetadatum(
        url: url ?? this.url,
        format: format ?? this.format,
        height: height ?? this.height,
        width: width ?? this.width,
      );

  factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
        url: json["url"],
        format: json["format"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "format": format,
        "height": height,
        "width": width,
      };
}
