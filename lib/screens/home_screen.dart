import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:news_app/bloc/bloc%20states.dart';
import 'package:news_app/bloc/newsBloc.dart';
import 'package:news_app/models/articlesModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[600],
          title: const Text("News"),
        ),
        body: BlocBuilder<DataBloc, States>(
          builder: (BuildContext context, States state) {
            if (state is UpdateStates) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetDataStates) {
              List<ArticleModel> articles = [];
              articles = state.articles;
              return Container(
                margin: const EdgeInsets.only(top: 8),
                child: ListView.separated(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("tapped");
                        FlutterWebBrowser.openWebPage(
                          url: articles[index].url.toString(),
                          customTabsOptions: CustomTabsOptions(
                            colorScheme: CustomTabsColorScheme.dark,
                            toolbarColor: Colors.deepPurple,
                            secondaryToolbarColor: Colors.green,
                            navigationBarColor: Colors.amber,
                            addDefaultShareMenuItem: true,
                            instantAppsEnabled: true,
                            showTitle: true,
                            urlBarHidingEnabled: true,
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(40)),
                        ),
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      articles[index].urlToImage.toString())),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Text(
                                articles[index].title.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),

                            //Text(articles[index].author.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.white,
                      thickness: 2,
                    );
                  },
                ),
              );
            } else if (state is DataError) {
              String error = state.errorMsg;

              return Center(
                child: Text(error),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
