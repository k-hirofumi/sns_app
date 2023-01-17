import 'package:dio/dio.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/providers/appProvider.dart';
import 'package:sns_app/utils/instance_store.dart';

extension ApiSearvice on Dio {
  static const header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  static final provider = InstanceStore().getInstance<AppProvider>();

  static Future<dynamic> get(
    String pass, {
    Map<String, dynamic>? queryParameters,
    // Options? options,
    // CancelToken? cancelToken,
    // void Function(int, int)? onReceiveProgress,
  }) async{
    print("get");
    return await Dio().get(const String.fromEnvironment('BASE_URL') + pass,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          ...header,
          if(provider.accessToken != "")  "Authorization": provider.accessToken,
        },
      ),
    ).then((response) {
      print(response.data);
      return response.data;
    }).catchError((onError){
      //ハンドリングしていないエラーが発生した場合
      print(onError);
      MainNav.showUnexpectErrorDialog();
      return null;
    });
  } 

  static Future<dynamic> post (
    String pass,{
    dynamic data,
    Map<String, dynamic>? queryParameters,
    // Options? options,
    // CancelToken? cancelToken,
    // void Function(int, int)? onSendProgress,
    // void Function(int, int)? onReceiveProgress,
  }) async{
    print("post");
    print(const String.fromEnvironment('BASE_URL') + pass);
    return await Dio().post(const String.fromEnvironment('BASE_URL') + pass, 
      data:data, 
      queryParameters:queryParameters, 
      options: Options(
        headers: {
          ...header,
          if(provider.accessToken != "")  "Authorization": provider.accessToken,
        },
      ),
    ).then((response) {
      print(response.data);
      return response.data;
    }).catchError((onError){
      //ハンドリングしていないエラーが発生した場合
      print(onError);
      MainNav.showUnexpectErrorDialog();
      return null;
    });
  } 
}