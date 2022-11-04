import 'package:equatable/equatable.dart';

import '../../data/models/article_model.dart';

class Article extends Equatable {
  final int? id;
  final String? source;
  final DateTime? publishedDate;
  final String? section;
  final String? byline;
  final String? type;
  final String? title;
  final String? articleModelAbstract;
  final List<Media>? media;

  const Article({this.id, this.source, this.publishedDate, this.section, this.byline,
      this.type, this.title, this.articleModelAbstract,this.media});

  @override
  List<Object?> get props => [
        id,
        source,
        publishedDate,
        section,
        byline,
        type,
        title,
        articleModelAbstract,
        media,
      ];
}
