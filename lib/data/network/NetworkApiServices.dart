import 'dart:io';

import 'package:dio/dio.dart';

import '../../data/app_excaptions.dart';
import '../../data/network/BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  final dio = Dio();
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      Response response =
          await dio.get(url).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(' No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await dio.post(url, data: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(' No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(dynamic response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 404:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error accured while communcation with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
