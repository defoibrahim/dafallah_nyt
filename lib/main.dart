import 'package:dafallah_nyt/core/theme/app_theme.dart';
import 'package:dafallah_nyt/features/articles/presentation/bloc/bloc/articles_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'features/articles/presentation/pages/article.dart';
import 'injections.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ArticlesBloc>()..add(GetAllArticlesEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Nyt Articles',
        home: const ArticlePage(),
      ),
    );
  }
}
