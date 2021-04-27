abstract class NewsAppState {}

class InitialState extends NewsAppState {}

class ChangeCurrentIndexState extends NewsAppState {}

class SportArticle extends NewsAppState {}

class LoadingSportArticle extends NewsAppState {}

class ErrorSportArticle extends NewsAppState {
  final String message;

  ErrorSportArticle(this.message);
}

class BusinessArticle extends NewsAppState {}

class LoadingBusinessArticle extends NewsAppState {}

class ErrorBusinessArticle extends NewsAppState {
  final String message;

  ErrorBusinessArticle(this.message);
}

class ScienceArticle extends NewsAppState {}

class LoadingScienceArticle extends NewsAppState {}

class ErrorScienceArticle extends NewsAppState {
  final String message;

  ErrorScienceArticle(this.message);
}

class AppThemeState extends NewsAppState {}

class SearchArticle extends NewsAppState {}

class LoadingSearchArticle extends NewsAppState {}

class ErrorSearchArticle extends NewsAppState {
  final String message;

  ErrorSearchArticle(this.message);
}
