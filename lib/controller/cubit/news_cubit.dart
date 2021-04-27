import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_states.dart';
import 'package:flutter_abdallah_news/controller/dio/dio_helper.dart';
import 'package:flutter_abdallah_news/views/widgets/business.dart';
import 'package:flutter_abdallah_news/views/widgets/science.dart';
import 'package:flutter_abdallah_news/views/widgets/seetings_screen.dart';
import 'package:flutter_abdallah_news/views/widgets/sport.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsAppCubit extends Cubit<NewsAppState> {
  NewsAppCubit(NewsAppState initialState) : super(initialState);
  int currentIndex = 0;

  List<BottomNavigationBarItem> barItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Seetings',
    ),
  ];
  static NewsAppCubit get(context) => BlocProvider.of<NewsAppCubit>(context);

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
    if (index == 0) getBusinessNews();
    if (index == 1) getSportNews();
    if (index == 2) getScienceNews();
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    SciencesScreen(),
    SeetingsScreen()
  ];
  List<dynamic> sports = [];
  List<dynamic> business = [];
  List<dynamic> science = [];

  getSportNews() async {
    if (sports.length == 0) {
      emit(LoadingSportArticle());
      await DioHelper.getArticles(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sport',
        'apiKey': 'd6e5b8cd16b5452b860f67b8aa62b6d6'
      }).then((value) => sports = value.data['articles']).catchError((error) {
        emit(ErrorSportArticle(error.toString()));
      });
      emit(SportArticle());
    } else {
      emit(SportArticle());
    }
  }

  getScienceNews() async {
    if (science.length == 0) {
      emit(LoadingScienceArticle());
      await DioHelper.getArticles(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'd6e5b8cd16b5452b860f67b8aa62b6d6'
      }).then((value) => science = value.data['articles']).catchError((error) {
        emit(ErrorScienceArticle(error.toString()));
      });
      emit(ScienceArticle());
    } else {
      emit(ScienceArticle());
    }
  }

  getBusinessNews() async {
    if (business.length == 0) {
      emit(LoadingBusinessArticle());
      await DioHelper.getArticles(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'd6e5b8cd16b5452b860f67b8aa62b6d6'
      }).then((value) => business = value.data['articles']).catchError((error) {
        emit(ErrorBusinessArticle(error.toString()));
      });
      emit(BusinessArticle());
    } else {
      emit(BusinessArticle());
    }
  }

  Future<void> setShare(String key, dynamic val) async {
    final pref = await SharedPreferences.getInstance();
    if (val is bool) pref.setBool(key, val);
    if (val is String) pref.setString(key, val);
  }

  Future<dynamic> getPref(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.get(key);
  }

  changeInitialLight(bool isLightt) {
    isLight = isLightt ?? true;
    emit(AppThemeState());
  }

  bool isLight = true;
  changeMode() async {
    isLight = !isLight;
    await setShare('isLight', isLight);
    emit(AppThemeState());
  }

  List<dynamic> search = [];
  getSearchNews(String value) async {
    emit(LoadingSearchArticle());
    await DioHelper.getArticles(
            url: 'v2/everything',
            query: {'q': value, 'apiKey': 'd6e5b8cd16b5452b860f67b8aa62b6d6'})
        .then((value) {
      search = value.data['articles'];
      emit(SearchArticle());
    }).catchError((error) => emit(ErrorSearchArticle(error.toString())));
  }
}
