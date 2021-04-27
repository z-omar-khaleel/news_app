import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_cubit.dart';
import 'package:flutter_abdallah_news/controller/cubit/news_states.dart';
import 'package:flutter_abdallah_news/controller/dio/dio_helper.dart';
import 'package:flutter_abdallah_news/views/screens/news_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant/constant.dart';
import 'controller/cubit/cubit_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  final pref = await SharedPreferences.getInstance();

  runApp(MyApp(isLight: pref.get('isLight') as bool));
}

class MyApp extends StatelessWidget {
  final bool isLight;

  MyApp({this.isLight});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit(InitialState())
        ..changeInitialLight(isLight)
        ..getBusinessNews(),
      child: BlocConsumer<NewsAppCubit, NewsAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: NewsAppCubit.get(context).isLight
                ? ThemeMode.light
                : ThemeMode.dark,
            home: Directionality(
              child: NewsLayout(),
              textDirection: TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('Data')],
      ),
      appBar: AppBar(
        title: Text('App Bar'),
      ),
    );
  }
}
