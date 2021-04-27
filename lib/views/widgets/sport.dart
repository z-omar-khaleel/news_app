import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_cubit.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_states.dart';
import 'package:flutter_abdallah_news/views/widgets/build_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ErrorSportArticle) print(state.message);
      },
      builder: (context, state) {
        final list = NewsAppCubit.get(context).sports;
        return ConditionalBuilder(
            condition: list.length > 0,
            builder: (context) => BuildArticle(list),
            fallback: (context) => !(state is ErrorSportArticle)
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
