import 'package:dafallah_nyt/features/articles/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/common_widget.dart';
import '../../data/models/article_model.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CommonWidgets.appText(
              DateFormat('yyyy-MM-dd ', 'en_US').format(article.publishedDate!),
              fontSize: 13,
              color: Colors.black87,
            ),
          ],
        ),
        CommonWidgets.appText(
          article.title!,
          fontSize: 20,
          color: Colors.black,
        ),
        const SizedBox(height: 16),
        CommonWidgets.appText(
          article.articleModelAbstract!,
          fontSize: 16,
          color: Colors.black54,
        ),
      ],
    );
  }
}
