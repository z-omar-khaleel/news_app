import 'package:flutter/material.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_cubit.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_states.dart';
import 'package:flutter_abdallah_news/views/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c) => SearchScreen()));
                  }),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: () {
                  NewsAppCubit.get(context).changeMode();
                },
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [...NewsAppCubit.get(context).barItems],
            currentIndex: NewsAppCubit.get(context).currentIndex,
            onTap: (index) {
              NewsAppCubit.get(context).changeCurrentIndex(index);
            },
          ),
          body: NewsAppCubit.get(context)
              .screens[NewsAppCubit.get(context).currentIndex],
        );
      },
    );
  }
}
