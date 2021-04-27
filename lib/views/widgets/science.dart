import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_cubit.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'build_article.dart';

class SciencesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ErrorScienceArticle) print(state.message);
      },
      builder: (context, state) {
        final list = NewsAppCubit.get(context).science;
        return ConditionalBuilder(
            condition: list.length > 0,
            builder: (context) => BuildArticle(list),
            fallback: (context) => !(state is ErrorScienceArticle)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Text('Error'),
                  ));
      },
    );
  }
}
