import 'dart:convert';

import 'package:craft_bay/Data/services/response.dart';

import 'package:http/http.dart';

class network_caller {
  Future<ResponseData> getRequest(String url) async {
    final Response response = await get(Uri.parse(url));
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
