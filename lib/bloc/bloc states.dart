import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/models/articlesModel.dart';

class States extends Equatable {
  const States();
  @override
  List<Object?> get props => [];
}

class InitStates extends States {}

class UpdateStates extends States {}

class GetDataStates extends States {
  final List<ArticleModel> articles;
  GetDataStates(@required this.articles);
}

class DataError extends States {
  String errorMsg;
  DataError(@required this.errorMsg);
}
