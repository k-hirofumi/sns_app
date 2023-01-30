import 'package:flutter/material.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/network/request/new_post_request.dart';
import 'package:sns_app/utils/instance_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sns_app/network/request/login_request.dart';

class AppProvider with ChangeNotifier {
  AppProvider();

  InstanceStore get _store => InstanceStore();
  SharedPreferences get _pref => _store.getInstance<SharedPreferences>();


  bool _isLogin = false;

  bool get isLogin => _isLogin;

  Future<void> login(String email, String password) async{
    final result = await LoginRequest.login(email, password);
    if(result.accessToken != null) {
      setAccessToken(result.accessToken);
      _isLogin = true;
      _pref.setBool('isLogin', _isLogin);
      MainNav.toMain();
    } else{
      return;
    }
    notifyListeners();
  }

  void logout(){
    _isLogin = false;
    _pref.setBool('isLogin', _isLogin);
    notifyListeners();
  }

  String _accessToken  = "";

  String get accessToken => _accessToken;
  

  void setAccessToken(String id) {
    // コンソールに表示
    _accessToken = id;
    notifyListeners();
  }

  void clearAccessToken() {
    _accessToken = "";
    notifyListeners();
  }

  Future<void> newPost(String periods, String events) async{
    final result = await NewPostRequest.newPost(periods, events);
    if(result != null){
      await MainNav.showErrorMessageDialog(title:'投稿が完了しました', content: '', okButton: true);
      // notifyListeners();
    }
  }
}