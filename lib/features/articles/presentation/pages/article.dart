import 'package:cached_network_image/cached_network_image.dart';
import 'package:dafallah_nyt/core/common/common_widget.dart';
import 'package:dafallah_nyt/features/articles/presentation/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/bloc/articles_bloc.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() => AppBar(
        title: const Text('NY Times Most Popular'),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedArticleState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: ListView.separated(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  final artcile = state.articles[index];
                  bool haveImg =
                      artcile.media != null && artcile.media!.isNotEmpty;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ArticleDetails(
                            article: artcile,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(60)),
                              child: Hero(
                                tag: artcile.id.toString(),
                                child: CachedNetworkImage(
                                  width: 60,
                                  height: 60,
                                  placeholder: (context, url) => Image.asset(
                                    'assets/images/loading.gif',
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageUrl: haveImg
                                      ? artcile.media!.first.mediaMetadata!
                                          .first.url!
                                      : '',
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidgets.appText(
                                      state.articles[index].title!,
                                      maxLines: 2,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  const SizedBox(height: 8),
                                  CommonWidgets.appText(
                                    state.articles[index].byline!,
                                    maxLines: 1,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CommonWidgets.appText(
                                        state.articles[index].section!,
                                        fontSize: 14,
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.calendar_month_outlined,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 4),
                                      CommonWidgets.appText(
                                        DateFormat('yyyy-MM-dd ', 'en_US')
                                            .format(artcile.publishedDate!),
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(Icons.arrow_forward_ios_outlined),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
              ),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<ArticlesBloc>(context).add(RefreshArticlesEvent());
  }
}
