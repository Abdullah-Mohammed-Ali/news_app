import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc%20states.dart';
import 'package:news_app/bloc/blocEvents.dart';
import 'package:news_app/models/articlesModel.dart';
import 'package:news_app/models/news_api.dart';

class DataBloc extends Bloc<DataEvents, States> {
  NewsData _newsData;
  DataBloc(States initialState, @required this._newsData)
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<States> mapEventToState(DataEvents event) async* {
    if (event is StartEvent) {
      try {
        List<ArticleModel>? _articles = [];
        yield InitStates();
        _articles = await _newsData.fetchData();
        yield GetDataStates(_articles!);
      } catch (e) {
        print(e);
        yield DataError(e.toString());
      }
    }
  }
}
