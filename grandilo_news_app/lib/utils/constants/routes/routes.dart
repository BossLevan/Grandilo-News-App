import 'package:flutter/material.dart';
import 'package:grandilo_news_app/screens/details_screen/ui/news_detail_screen.dart';
import 'package:grandilo_news_app/screens/home_screen/ui/home_screen.dart';
import 'package:grandilo_news_app/screens/login_screen/ui/login_screen.dart';
import 'package:grandilo_news_app/screens/signup_screen/ui/signup_screen.dart';

class RouteNames {
  //Custom class that holds all the named routes as constants for easy reference
  static const String signUp = 'signUp';
  static const String logIn = 'logIn';
  static const String homeScreen = 'homeScreen';
  static const String newsDetailScreen = 'newsDetailScreen';

  //Routes and their respective Pages.
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.signUp: (context) => LogInScreen(),
    RouteNames.logIn: (context) => SignUpScreen(),
    RouteNames.homeScreen: (context) => HomeScreen(),
    RouteNames.newsDetailScreen: (context) => NewsDetailScreen(),
  };
}
