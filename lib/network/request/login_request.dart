import 'package:dio/dio.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/network/model/error_response.dart';
import 'package:sns_app/network/model/login_response.dart';
import 'package:sns_app/utils/api_searvice.dart';

class LoginRequest {

  static Future<dynamic> login() async {
    var result;
    try {
      result = await ApiSearvice.post('http://localhost/app.api/login',
        data: new FormData.fromMap(
          {
            "email": "user1@example.com",
            "password": "123456",
            // "device_name": "test_device"
          }
        )
      );
      return LoginResponse.fromJson(result);
    }catch(error){
      try{
        final error = ErrorResponse.fromJson(result);
        String content = "";
        if(error.code == 1001) content = "メールアドレスまたはパスワードの形式が正しくありません";
        if(error.code == 1002) content = "メールアドレスまたはパスワードが正しくありません";

        await MainNav.showErrorMessageDialog(title:error.message, content: content, okButton: true);
      }catch(e){
        //エラーレスポンスの形式が不正な場合
        MainNav.showUnexpectErrorDialog(); 
      }
    }
  }
}

