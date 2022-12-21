import 'package:flutter/material.dart';
import 'package:sns_app/instance_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sns_app/network/request/get_user_info_request.dart';
import 'package:sns_app/network/request/login_request.dart';

class AppProvider with ChangeNotifier {
  AppProvider();

  InstanceStore get _store => InstanceStore();
  SharedPreferences get _pref => _store.getInstance<SharedPreferences>();


  bool _isLogin = false;

  bool get isLogin => _isLogin;

  Future<void> login() async{
    final String? id = await LoginRequest.login();
    if(id != null) {
      setTokenId(id);
      _isLogin = true;
      _pref.setBool('isLogin', _isLogin);
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

    String _tokenId  = "";

  String get tokenId => _tokenId;
  

  void setTokenId(String id) {
    // コンソールに表示
    _tokenId = id;
    notifyListeners();
  }

  void clearTokenId() {
    _tokenId = "";
    notifyListeners();
  }
}