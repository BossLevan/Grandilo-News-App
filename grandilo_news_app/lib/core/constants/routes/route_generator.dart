import 'package:flutter/material.dart';
import 'package:grandilo_news_app/core/constants/routes/routes.dart';
import 'package:grandilo_news_app/ui/navigation/page_navigation.dart';
import 'package:grandilo_news_app/ui/screens/home_screen.dart';
import 'package:grandilo_news_app/ui/screens/login_screen.dart';
import 'package:grandilo_news_app/ui/screens/news_detail_screen.dart';
import 'package:grandilo_news_app/ui/screens/signup_screen.dart';

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
