import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/providers/appProvider.dart';
import 'package:sns_app/utils/instance_store.dart';

extension ApiSearvice on Dio {
  static const header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  static final provider = InstanceStore().getInstance<AppProvider>();

  static final dio = Dio()..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        // リクエストをインターセプトする
        if (kDebugMode) {
          print('Request: ${options.method} ${options.path} ');
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // レスポンスをインターセプトする
        if (kDebugMode) {
          print('Response: ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path} ${response.data}');
        }
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        // エラーをインターセプトする
        if (kDebugMode) {
          print('Error: ${e.response?.statusCode} ${e.requestOptions.method} ${e.requestOptions.path}');
        }
        return handler.next(e);
      },
    ),
  );



  static Future<dynamic> get(
    String pass, {
    Map<String, dynamic>? queryParameters,
  }) async{
    return await dio.get(const String.fromEnvironment('BASE_URL') + pass,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          ...header,
          if(provider.accessToken != "")  "Authorization": provider.accessToken,
        },
      ),
    ).then((response) {
      return response.data;
    }).catchError((onError){
      //ハンドリングしていないエラーが発生した場合
      if (kDebugMode) {
        print(onError);
      }
      MainNav.showUnexpectErrorDialog();
      return null;
    });
  } 

  static Future<dynamic> post (
    String pass,{
    dynamic data,
    Map<String, dynamic>? queryParameters,

  }) async{
    return await dio.post(const String.fromEnvironment('BASE_URL') + pass, 
      data:data, 
      queryParameters:queryParameters, 
      options: Options(
        headers: {
          ...header,
          if(provider.accessToken != "")  "Authorization": provider.accessToken,
        },
      ),
    ).then((response) {
      return response.data;
    }).catchError((onError){
      //ハンドリングしていないエラーが発生した場合
      if (kDebugMode) {
        print(onError);
      }
      MainNav.showUnexpectErrorDialog();
      return null;
    });
  } 
}