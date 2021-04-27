import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_cubit.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_states.dart';
import 'package:flutter_abdallah_news/views/widgets/build_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  String x = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    NewsAppCubit.get(context).getSearchNews(val);
                    x = val;
                  },
                  validator: (val) {
                    if (val.isEmpty) return 'Search must not be Empty';
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(.1),
                    filled: true,
                    labelText: 'Search',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.search),
                  ))),
          Expanded(
            child: BlocConsumer<NewsAppCubit, NewsAppState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                final list = NewsAppCubit.get(context).search;
                return ConditionalBuilder(
                    condition: list.length > 0,
                    builder: (context) => BuildArticle(list),
                    fallback: (context) => !(state is ErrorSearchArticle)
                        ? Center(
                            child: !(state is LoadingSearchArticle)
                                ? Container()
                                : CircularProgressIndicator(),
                          )
                        : Center(
                            child: Text('Error'),
                          ));
              },
            ),
          )
        ]));
  }
}
