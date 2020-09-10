import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grandilo_news_app/screens/signup_screen/bloc/signup_bloc.dart';
import 'package:grandilo_news_app/utils/theme/app_theme.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    return SignUpScreen();
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool obscureText = true;

  FocusNode passwordNode = new FocusNode();
  FocusNode emailNode = new FocusNode();
  String _username, _email, _password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: BlocListener<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state.isFailure) {}
                if (state.isSubmitting) {}
                if (state.isSuccess) {}
              },
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: appThemeData.primaryColorDark),
                            ),
                            SizedBox(height: 20.h),
                            RichText(
                              text: TextSpan(
                                text: 'Already have an account?',
                                style: TextStyle(
                                    color: appThemeData.primaryColorDark,
                                    fontSize: 17.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Sign In',
                                    style: TextStyle(
                                        color: appThemeData.primaryColor),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 60.h),
                            Text(
                              'Email Address',
                              style: TextStyle(
                                  color: emailNode.hasFocus
                                      ? appThemeData.primaryColor
                                      : Colors.black87,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(height: 12.h),
                            TextFormField(
                              style: TextStyle(
                                  color: emailNode.hasFocus
                                      ? appThemeData.primaryColor
                                      : appThemeData.primaryColorDark),
                              keyboardType: TextInputType.emailAddress,
                              focusNode: emailNode,
                              controller: emailController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: appThemeData.primaryColor,
                                      width: 1),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.w),
                                  ),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: passwordNode.hasFocus
                                      ? appThemeData.primaryColor
                                      : Colors.black87,
                                  fontSize: 15.sp),
                            ),
                            SizedBox(height: 12.h),
                            TextFormField(
                              obscureText: obscureText,
                              style: TextStyle(
                                  color: passwordNode.hasFocus
                                      ? appThemeData.primaryColor
                                      : appThemeData.primaryColorDark),
                              focusNode: passwordNode,
                              controller: passwordController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: appThemeData.primaryColor,
                                      width: 1),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye,
                                      color: appThemeData.primaryColorDark),
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.w),
                                  ),
                                ),
                              ),
                              textInputAction: TextInputAction.done,
                            ),
                            SizedBox(height: 54.h),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  // Navigator.pushNamed(
                                  //     context, RouteNames.portfolioScreen);
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.w))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
