import 'package:childrens_stories/src/networks/exception_http.dart';
import 'package:childrens_stories/src/networks/interceptors_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClientPackges {
  final Dio _dio = Dio();
  final _exception = ExceptionHttp();

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryPrameters,
    isInterceptor = true,
    hasOptionalToast = false,
    hasModal = false,
  }) async {
    Response response = await _dio
        .get(
      url,
      queryParameters: queryPrameters,
      options: isInterceptor
          ? Options(
              headers: await InterceptorsApp().headerToken(),
              validateStatus: (status) {
                return true;
              },
            )
          : null,
    )
        .onError((error, stackTrace) {
      throw Error();
    });
    await _exception.validation(response);
    return response;
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryPrameters,
    isInterceptor = true,
    hasToast = true,
    hasModal = false,
  }) async {
    Response response = await _dio.post(
      url,
      data: data,
      queryParameters: queryPrameters,
      options: isInterceptor
          ? Options(
              headers: await InterceptorsApp().headerToken(),
              validateStatus: (status) {
                return true;
              },
            )
          : null,
    );
    if (hasToast) {
      await _exception.validation(response);
    }

    return response;
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryPrameters,
    isInterceptor = true,
    hasModal = false,
  }) async {
    Response response = await _dio
        .put(
      url,
      data: data,
      queryParameters: queryPrameters,
      options: isInterceptor
          ? Options(
              headers: await InterceptorsApp().headerToken(),
              validateStatus: (status) {
                return true;
              },
            )
          : null,
    )
        .onError((error, stackTrace) async {
      if (error.runtimeType == DioError) {
        DioError e = error as DioError;
        await _exception.validation(e.response!);
      }
      throw Error();
    });
    await _exception.validation(response);
    return response;
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryPrameters,
    isInterceptor = true,
    hasModal = false,
  }) async {
    Response response = await _dio
        .delete(
      url,
      data: data,
      queryParameters: queryPrameters,
      options: isInterceptor
          ? Options(
              headers: await InterceptorsApp().headerToken(),
              validateStatus: (status) {
                return true;
              },
            )
          : null,
    )
        .onError((error, stackTrace) {
      throw Error();
    });
    await _exception.validation(response);
    return response;
  }
}
