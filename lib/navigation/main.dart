import 'package:flutter/material.dart';
import 'package:sns_app/components/main/network_error_dialog.dart';
import 'package:sns_app/components/main/network_unexpect_error_dialog.dart';
import 'package:sns_app/pages/login/login.dart';
import '../main.dart';
import '../pages/post/post.dart';

class MainNav{
    static final mainRoutes = <String,WidgetBuilder>{
    "/" : (context) => MainPage(),
    "/addNewPost" : (context) => NewPost(),
    "/login" : (context) => LoginForm(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState  _navigatorState = navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }

  static void toMain(){
    _navigatorState.pushNamedAndRemoveUntil('/', ModalRoute.withName('/'),);
  }

  static Future<void> showUnexpectErrorDialog()async{
    await showDialog<void>(
    context: _navigatorState.context,
    builder: (_) {
      return NetworkUnexpectErrorDialog();
    });
  }

  static Future<void> showErrorMessageDialog({
    Key? key,
    final String? title,
    final String? content,
    final bool? okButton,
    final String? okButtonTitle,
    final void Function()? okButtonAction,
    final bool? ngButton,
    final String? ngButtonTitle,
    final void Function()? ngButtonAction,
  })async {
    await showDialog<void>(
    context: _navigatorState.context,
    builder: (_) {
      return NetworkErrorDialog(
        key: key,
        title: title,
        content: content,
        okButton: okButton,
        okButtonTitle: okButtonTitle,
        okButtonAction: okButtonAction,
        ngButton: ngButton,
        ngButtonTitle: ngButtonTitle,
        ngButtonAction: ngButtonAction,
      );
    });
  }

  static Future<void> toNewPostOrverlay(BuildContext context){
    return _navigatorState.pushNamed('/addNewPost');
  }
}