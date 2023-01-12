import 'package:dio/dio.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/network/model/error_response.dart';
import 'package:sns_app/network/model/login_response.dart';
import 'package:sns_app/utils/api_searvice.dart';

class LoginRequest {

  static Future<dynamic> login(String email, String passowrd) async {
    var result;
    try {
      result = await ApiSearvice.post('http://localhost/app.api/login',
        data: new FormData.fromMap(
          {
            // "email": email,
            // "password": passowrd
            "email": "user1@example.com",
            "password": "123456",
          }
        )
      );
      return LoginResponse.fromJson(result);
    }catch(error){
      try{
        final error = ErrorResponse.fromJson(result);
        await MainNav.showErrorMessageDialog(title:error.message, content: error.content, okButton: true);
      }catch(e){
        //エラーレスポンスの形式が不正な場合
        MainNav.showUnexpectErrorDialog(); 
      }
    }
  }
}

