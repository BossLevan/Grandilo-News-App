import 'package:flutter/material.dart';
import 'package:grandilo_news_app/ui/screens/home_screen.dart';
import 'package:grandilo_news_app/ui/screens/login_screen.dart';
import 'package:grandilo_news_app/ui/screens/news_detail_screen.dart';
import 'package:grandilo_news_app/ui/screens/signup_screen.dart';

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
