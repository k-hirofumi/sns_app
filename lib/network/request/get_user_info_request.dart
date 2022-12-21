import 'package:dio/dio.dart';
import 'package:sns_app/instance_store.dart';
import 'package:sns_app/network/mock/posts_mock.dart';
import 'package:sns_app/network/model/postInfo_response.dart';
import 'package:sns_app/network/model/userInfo_response.dart';
import 'package:sns_app/providers/accountProvider.dart';
import 'package:sns_app/providers/appProvider.dart';

class GetUserInfoRequest {
  // static Future<PostInfoResponse> getPostForHome() async {
  //    final result = await http.post(Uri.https('example.com', 'whatsit/create'), body: {'key': 'value',});
  //    return PostInfoResponse.fromJson(result.body[0]);
  // }

  static Future<UserInfoResponse?> getUserInfo() async {
    const header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      // "Authorization": "Bearer 1|JInSTb0c7e50VUeE7qawJh1nSMsfTcCi6GGesfR9",
    };
      final provider = InstanceStore().getInstance<AppProvider>();

    return Dio().get('http://localhost/app.api/user',
        options: Options(
          headers: {
            ...header,
            "Authorization": "Bearer "+ provider.tokenId,
          },
        ),
      ).then((response) {
        print(response);

        return UserInfoResponse.fromJson(response.data);  

      }).catchError((e){
        print('error:id '+provider.tokenId);
        throw e;
      });
      

      // for (var post in response.data.length){
      //   posts.add(PostInfoResponse.fromJson(response.data));
      // }
      // return posts;
  }
}