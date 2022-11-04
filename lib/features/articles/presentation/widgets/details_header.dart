import 'package:cached_network_image/cached_network_image.dart';
import 'package:dafallah_nyt/features/articles/domain/entities/article.dart';
import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    Key? key,
    required this.haveImg,
    required this.article,
  }) : super(key: key);

  final bool haveImg;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: haveImg ? article.media!.first.mediaMetadata![2].url! : '',
      placeholder: (context, url) => Image.asset(
        'assets/images/loading.gif',
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey,
        child: Image.network(
          'https://static01.nyt.com/images/2020/10/11/business/11report-06/11report-06-mobileMasterAt3x.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
