import 'package:flutter/material.dart';

class BackgroundScreenUtil extends SizedBox {
  BackgroundScreenUtil({@required Widget child})
      : super.expand(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                  0.3,
                  0.4,
                  0.9
                ],
                    colors: [
                  Colors.lightGreen,
                  Colors.yellowAccent,
                  Colors.lightBlue
                ])),
            child: child,
          ),
        );
}
