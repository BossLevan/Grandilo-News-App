import 'package:flutter/material.dart';
import 'package:grandilo_news_app/screens/home_screen/ui/home_screen.dart';
import 'package:grandilo_news_app/screens/login_screen/ui/login_screen.dart';
import 'package:grandilo_news_app/screens/signup_screen/ui/signup_screen.dart';
import 'package:grandilo_news_app/utils/constants/routes/routes.dart';
import 'package:grandilo_news_app/utils/navigation/page_navigation.dart';

//custom class to generate routes
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return CustomSlideTransition(child: HomeScreen());
        break;
      case RouteNames.logIn:
        return CustomSlideTransition(child: LoginScreen());
        break;
      case RouteNames.signUp:
        return CustomSlideTransition(child: SignUpScreen());
        break;
    }
  }
}
