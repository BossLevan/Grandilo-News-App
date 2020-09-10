import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grandilo_news_app/core/models/news_model.dart';
import 'package:grandilo_news_app/screens/details_screen/bloc/details_bloc.dart';
import 'package:grandilo_news_app/screens/details_screen/ui/news_detail_screen.dart';
import 'package:grandilo_news_app/screens/home_screen/bloc/homescreen_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  final String email;

  HomeScreen({this.email});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomescreenBloc>(context);
    homeBloc.add(OnNavToHomeScreen());
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Headlines'),
      ),
      body: BlocBuilder<HomescreenBloc, HomescreenState>(
        builder: (context, state) {
          if (state is HomescreenLoading) {
            return buildLoadingIndicator(context);
          }
          if (state is HomescreenLoaded) {
            return BuildListView(state);
          }
          if (state is HomescreenError) {
            return BuildErrorView(state: state);
          }
        },
      ),
    );
    homeBloc.close();
  }

  Widget buildLoadingIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.black),
      ),
    );
  }
}

class BuildListView extends StatefulWidget {
  final HomescreenLoaded state;

  BuildListView(this.state);

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        cacheExtent: 9999,
        physics: BouncingScrollPhysics(),
        itemCount: widget.state.newsList.news.length,
        itemBuilder: (_, index) {
          final singleNews = widget.state.newsList.news[index];
          return CustomListTile(news: singleNews);
        },
      ),
    );
  }
}

class BuildErrorView extends StatelessWidget {
  final HomescreenError state;

  BuildErrorView({this.state});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(state.message),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final News news;
  CustomListTile({this.news});
  @override
  Widget build(BuildContext context) {
    final detailsBloc = BlocProvider.of<DetailsBloc>(context);
    return Column(
      children: <Widget>[
        InkWell(
          splashColor: Colors.black,
          onTap: () {
            detailsBloc.add(DetailsLoadedEvent(news: news));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetailScreen(news)));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100.0,
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          news.title,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              timeago.format(DateTime.parse(news.publishTime)),
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              'Source: ${news.source.name}',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100.0,
                    child: Image.network(
                      news.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Divider(
          height: 3.0,
          thickness: 1,
        )
      ],
    );
  }
}
