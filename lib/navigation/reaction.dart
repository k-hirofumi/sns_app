import 'package:flutter/material.dart';
import '../pages/reaction/reaction.dart';
import '../pages/post/post.dart';

class ReactionNav{
    static final reactionRoutes = <String,WidgetBuilder>{
    "/" : (context) => ReactionScreen(),
    "/reaction/second" : (context) => NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState  _navigatorState = navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }
}