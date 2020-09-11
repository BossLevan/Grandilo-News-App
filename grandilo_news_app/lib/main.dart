import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandilo_news_app/core/repositories/news_repository.dart';
import 'package:grandilo_news_app/core/repositories/user_repository.dart';
import 'package:grandilo_news_app/core/services/news_api_client.dart';
import 'package:grandilo_news_app/screens/details_screen/bloc/details_bloc.dart';
import 'package:grandilo_news_app/screens/home_screen/bloc/homescreen_bloc.dart';
import 'package:grandilo_news_app/screens/home_screen/ui/home_screen.dart';
import 'package:grandilo_news_app/screens/login_screen/bloc/login_bloc.dart';
import 'package:grandilo_news_app/screens/signup_screen/bloc/signup_bloc.dart';
import 'package:grandilo_news_app/screens/signup_screen/ui/signup_screen.dart';
import 'package:grandilo_news_app/utils/auth/auth.dart';
import 'package:grandilo_news_app/utils/auth/auth_bloc/auth_bloc.dart';
import 'package:grandilo_news_app/utils/constants/routes/route_generator.dart';
import 'package:grandilo_news_app/utils/constants/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //providing all the necessary repositories down the widget tree
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                NewsRepository(newsApiClient: NewsApiClient())),
        RepositoryProvider(create: (context) => UserRepository(Auth())),
      ],

      //providing all the necessary blocs down the widget tree
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context)),
          ),
          BlocProvider<DetailsBloc>(
            create: (context) => DetailsBloc(),
          ),
          BlocProvider<SignupBloc>(
            create: (context) =>
                SignupBloc(RepositoryProvider.of<UserRepository>(context)),
          ),
          BlocProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(RepositoryProvider.of<UserRepository>(context)),
          ),
          BlocProvider<HomescreenBloc>(
            create: (context) =>
                HomescreenBloc(RepositoryProvider.of<NewsRepository>(context)),
          ),
        ],
        child: MainApp(),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final UserRepository userRepository = UserRepository(Auth());
  AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc(userRepository: userRepository);
    authBloc.add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      //initialRoute: RouteNames.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is UnAuthenticated) {
            return SignUp();
          }
          if (state is Authenticated) {
            BlocProvider.of<HomescreenBloc>(context).add(OnNavToHomeScreen());
            return HomeScreen(email: state.user.email);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }
}
