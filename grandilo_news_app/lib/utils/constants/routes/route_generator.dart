import 'package:flutter/material.dart';
import 'package:grandilo_news_app/screens/details_screen/ui/news_detail_screen.dart';
import 'package:grandilo_news_app/screens/home_screen/ui/home_screen.dart';
import 'package:grandilo_news_app/screens/login_screen/ui/login_screen.dart';
import 'package:grandilo_news_app/screens/signup_screen/ui/signup_screen.dart';
import 'package:grandilo_news_app/utils/constants/routes/routes.dart';
import 'package:grandilo_news_app/utils/navigation/page_navigation.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return CustomSlideTransition(child: HomeScreen());
        break;
      case RouteNames.logIn:
        return CustomSlideTransition(child: LogInScreen());
        break;
      case RouteNames.newsDetailScreen:
        return CustomSlideTransition(child: NewsDetailScreen());
        break;
      case RouteNames.signUp:
        return CustomSlideTransition(child: SignUpScreen());
        break;
    }
  }
}
