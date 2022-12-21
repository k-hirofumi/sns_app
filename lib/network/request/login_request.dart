import 'package:dio/dio.dart';
import 'package:sns_app/network/mock/posts_mock.dart';
import 'package:sns_app/network/model/postInfo_response.dart';

class LoginRequest {


  static Future<String?> login() async {
    // const header = {
    //   "Content-Type": "application/json",
    //   "Accept": "application/json",
    //   // "Authorization": "Bearer 1|JInSTb0c7e50VUeE7qawJh1nSMsfTcCi6GGesfR9",
    // };

    return await Dio().post('http://localhost/app.api/login',
      data: new FormData.fromMap(
            {
              "email": "user1@example.com",
              "password": "123456",
              "device_name": "test_device"
            }
        ),
      ).then((response) {
        print("token_id : "+response.data);

        return response.data;
      }).catchError((err){
        throw err;
        // throw "getPostForHome error" ;
      }
    );
  }
}

