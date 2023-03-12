import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/base_response.dart';

// Calls the email verification endpoint. Return a BaseResponse response.
Future<BaseResponse> verifyEmailSvc(String emailVerificationToken) async {
  Map<String, String> headers = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };

  final queryParameter = {'token': emailVerificationToken};

  var uri = Uri.https(
      'open-days-thesis.herokuapp.com', 'open-days/users/email-verification', queryParameter);

  final rawResponse = await http
      .get(
        uri,
        headers: headers,
      )
      .timeout(const Duration(seconds: 5));

  Map<String, dynamic> parsedResponse = jsonDecode(rawResponse.body);

  return BaseResponse.fromJson(parsedResponse);
}
