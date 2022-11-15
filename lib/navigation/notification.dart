import 'package:flutter/material.dart';
import '../pages/notification/notification.dart';
import '../pages/post/post.dart';

class NotificationNav{
    static final notificationRoutes = <String,WidgetBuilder>{
    "/" : (context) => NotificationScreen(),
    "/notification/second" : (context) => NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState  _navigatorState = navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }
}