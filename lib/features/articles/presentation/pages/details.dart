import 'package:dafallah_nyt/features/articles/domain/entities/article.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/back_btn.dart';
import '../widgets/details_body.dart';
import '../widgets/details_header.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;
  const ArticleDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    bool haveImg = article.media != null && article.media!.isNotEmpty;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        CustomScrollView(
          primary: true,
          shrinkWrap: false,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 300,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: const BackBtn(),
              actions: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kMainColor,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Hero(
                  tag: article.id.toString(),
                  child: ArticleImage(haveImg: haveImg, article: article),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DetailsBody(article: article),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
