import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'logger.dart';
import 'showSnackBar.dart';

requestInterceptor(Request request) {
  var message = {
    'REQUEST URL:': request.url,
    'REQUEST HEADER:': request.headers,
    'REQUEST METHOD:': request.method,
    'REQUEST BODY': request.bodyBytes
  };
  request.headers['X-Api-Key'] = '1e777845da78417faa241d5813a10c23';
  logger.i(message);
  return request;
}

responseInterceptor(Request request, Response response) {
  var message = <String, dynamic>{
    'RESPONSE URL:': request.url,
    'RESPONSE CODE:': response.statusCode,
    'RESPONSE MESSAGE:': response.statusText,
    'RESPONSE BODY:': response.body,
    'RESPONSE UNAUTHORIZED:': response.unauthorized,
  };
  logger.i(message);
  showSnackBar(response.body['message'], onButtonClick: () {});
  return response;
}
