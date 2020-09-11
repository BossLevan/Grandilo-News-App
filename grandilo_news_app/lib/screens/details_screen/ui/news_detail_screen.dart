import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grandilo_news_app/core/models/news_model.dart';
import 'package:grandilo_news_app/screens/details_screen/bloc/details_bloc.dart';
import 'package:grandilo_news_app/utils/theme/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

//news detail screen
class NewsDetailScreen extends StatefulWidget {
  final News news;
  NewsDetailScreen(this.news);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  //instantiating a webviewcontroller to display the url
  //without leaving the app
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeData.primaryColorLight,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: appThemeData.primaryColorDark,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          '${widget.news.source.name}',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: appThemeData.primaryColorDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
              ),
            );
          }

          //when the url of the news is done loading
          if (state is DetailsLoadedState) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: widget.news.url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: ((WebViewController webViewController) {
                  _completer.complete(webViewController);
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
