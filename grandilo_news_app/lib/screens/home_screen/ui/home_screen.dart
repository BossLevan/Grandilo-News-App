import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grandilo_news_app/core/models/news_model.dart';
import 'package:grandilo_news_app/screens/details_screen/bloc/details_bloc.dart';
import 'package:grandilo_news_app/screens/details_screen/ui/news_detail_screen.dart';
import 'package:grandilo_news_app/screens/home_screen/bloc/homescreen_bloc.dart';
import 'package:grandilo_news_app/utils/theme/app_theme.dart';
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
    //for responsiveness
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    final homeBloc = BlocProvider.of<HomescreenBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeData.primaryColorLight,
        elevation: 0.0,
        title: Text(
          'Top Headlines',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: appThemeData.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
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

  //widget for loading indicator
  Widget buildLoadingIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.black),
      ),
    );
  }
}

//widget for the main List view
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

//widget incase there is an error
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

//widget for each list tile
class CustomListTile extends StatelessWidget {
  final News news;
  CustomListTile({this.news});
  @override
  Widget build(BuildContext context) {
    //instantiating a detailsBloc to make is easier to
    //make calls
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
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      //height: 100.0,
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            news.title,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 140.h,
                      child: Image.network(
                        news.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Text(
                news.description,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ]),
          ),
        ),
        SizedBox(
          height: 4.0.h,
        ),
        Divider(
          height: 3.0.h,
          thickness: 1.h,
        )
      ],
    );
  }
}

// Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               timeago.format(DateTime.parse(news.publishTime)),
//                               style: GoogleFonts.lato(
//                                 textStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               'Source: ${news.source.name}',
//                               style: GoogleFonts.lato(
//                                 textStyle: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
