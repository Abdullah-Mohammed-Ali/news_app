import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'articlesModel.dart';

class NewsData {
  Future<List<ArticleModel>?> fetchData() async {
    var data = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=20170889514c4c0f88e1839d33ffb096'),
    );
    Map decode = json.decode(data.body);
    print(decode["articles"]);
    List<ArticleModel> articles = [];
    print(data.statusCode);
    if (data.statusCode == 200) {
      int i = 0;
      for (var item in decode['articles']) {
        ArticleModel articlesModel = await ArticleModel.fromJson(item);
        articles.add(articlesModel);
        print(articles[i].urlToImage);
        i++;
      }
      return articles;
    } else {
      return articles = [];
    }
  }
}
