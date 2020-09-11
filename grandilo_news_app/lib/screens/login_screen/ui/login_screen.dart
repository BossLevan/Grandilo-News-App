import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grandilo_news_app/screens/login_screen/bloc/login_bloc.dart';
import 'package:grandilo_news_app/screens/signup_screen/bloc/signup_bloc.dart';
import 'package:grandilo_news_app/utils/auth/auth_bloc/auth_bloc.dart';
import 'package:grandilo_news_app/utils/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  FocusNode passwordNode = new FocusNode();
  FocusNode emailNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            //code to unfocus when you tap outside the text forms
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Login Failure'), Icon(Icons.error)],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              }
              if (state.isSubmitting) {
                //show snackbar
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Logging In...'),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  );
              }
              if (state.isSuccess) {
                //passing the event into the auth bloc
                BlocProvider.of<AuthBloc>(context).add(LoggedIn());
                Navigator.pop(context);
              }
            },
            child: BuildForm(
              formKey: _formKey,
              emailNode: emailNode,
              emailController: emailController,
              passwordNode: passwordNode,
              passwordController: passwordController,
            ),
          ),
        ),
      ),
    ));
  }
}

//UI for the email and password forms
class BuildForm extends StatefulWidget {
  const BuildForm({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.emailNode,
    @required this.emailController,
    @required this.passwordNode,
    @required this.passwordController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final FocusNode emailNode;
  final TextEditingController emailController;
  final FocusNode passwordNode;
  final TextEditingController passwordController;

  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Form(
            key: widget._formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: appThemeData.primaryColorDark),
                  ),
                  SizedBox(height: 60.h),
                  Text(
                    'Email Address',
                    style: TextStyle(
                        color: widget.emailNode.hasFocus
                            ? appThemeData.primaryColor
                            : Colors.black87,
                        fontSize: 15.sp),
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    autovalidate: true,
                    style: TextStyle(
                        color: widget.emailNode.hasFocus
                            ? appThemeData.primaryColor
                            : appThemeData.primaryColorDark),
                    keyboardType: TextInputType.emailAddress,
                    focusNode: widget.emailNode,
                    controller: widget.emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: appThemeData.primaryColor, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.w),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (_) {
                      return !state.isEmailValid ? 'Invalid Email' : null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: widget.passwordNode.hasFocus
                            ? appThemeData.primaryColor
                            : Colors.black87,
                        fontSize: 15.sp),
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(
                        color: widget.passwordNode.hasFocus
                            ? appThemeData.primaryColor
                            : appThemeData.primaryColorDark),
                    focusNode: widget.passwordNode,
                    controller: widget.passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: appThemeData.primaryColor, width: 1),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye,
                            color: appThemeData.primaryColorDark),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.w),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    validator: (_) {
                      return !state.isPasswordValid ? 'Invalid Password' : null;
                    },
                  ),
                  SizedBox(height: 54.h),
                  GestureDetector(
                    onTap: () {
                      if (widget._formKey.currentState.validate()) {
                        widget._formKey.currentState.save();
                        _onFormSubmitted(context);
                      }
                    },
                    child: Container(
                      height: 54.w,
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: appThemeData.primaryColorLight,
                              fontSize: 15.sp),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: appThemeData.buttonColor,
                          borderRadius: BorderRadius.all(Radius.circular(5.w))),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onFormSubmitted(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(
      (LoginSubmitted(
        email: widget.emailController.text,
        password: widget.passwordController.text,
      )),
    );
  }
}
