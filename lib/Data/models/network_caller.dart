import 'dart:convert';
import 'dart:developer';

import 'package:craft_bay/Data/services/response.dart';

import 'package:http/http.dart';

class network_caller {
  Future<ResponseData> getRequest(String url , {String? token}) async {
    log(url);
    log(token.toString());
    final Response response = await get(Uri.parse(url),headers: {
      'token': token.toString(),
      'Content-type' : 'application/json'
    });
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
            isSuccess: true,
            StatusCode: response.statusCode,
            responseData: decodeResponse);
      } else {
        return ResponseData(
          isSuccess: false,
          responseData: decodeResponse,
          StatusCode: response.statusCode,
          errorMessage: decodeResponse['data'] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
          isSuccess: false, StatusCode: response.statusCode, responseData: "");
    }
  }

  Future<ResponseData> postRequest(String url,{Map<String,dynamic> ? body ,String? token}) async {
    log(url);
    log(body.toString());
    final Response response = await post(Uri.parse(url) ,body: jsonEncode(body),
      headers: {'token': token.toString(), 'Content-type': 'application/json'},
    );
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
            isSuccess: true,
            StatusCode: response.statusCode,
            responseData: decodeResponse);
      } else {
        return ResponseData(
          isSuccess: false,
          responseData: decodeResponse,
          StatusCode: response.statusCode,
          errorMessage: decodeResponse['data'] ?? 'Something went wrong',
        );
      }
    } else {
      return ResponseData(
          isSuccess: false, StatusCode: response.statusCode, responseData: "");
    }
  }
}
