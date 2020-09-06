import 'package:flutter/material.dart';

class CustomSlideTransition extends PageRouteBuilder {
  final Widget child;
  CustomSlideTransition({this.child})
      : super(
          transitionDuration: Duration(milliseconds: 50),
          pageBuilder: (context, animation, secondaryAnomation) => child,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return Material(
              color: Theme.of(context).backgroundColor,
              child: SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(animation),
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  child: SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset.zero, end: const Offset(0.0, 1.0))
                        .animate(secondaryAnimation),
                    child: child,
                  ),
                ),
              ),
            );
          },
        );
}
