import 'package:flutter/material.dart';
import 'package:my_app/pages/home/homeSecond.dart';
import '../pages/home/home.dart';
import '../pages/post/post.dart';

class HomeNav{
    static final homeRoutes = <String,WidgetBuilder>{
    "/" : (context) => HomeScreen(),
    "/home/second" : (context) => HomeSecond(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState  _navigatorState = navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }
  static Future<void> toHomeSecondPage(){
    // return Navigator.of(context).pushNamed('/home/second');
    return _navigatorState.pushNamed('/home/second');
  }

}