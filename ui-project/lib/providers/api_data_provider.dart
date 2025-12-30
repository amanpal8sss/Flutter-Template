import 'dart:convert';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:web/web.dart' as web;

import 'package:flutter_template_web/core/constants.dart';
import 'package:flutter_template_web/models/api_models/get_user_by_email_response.dart';

final jwt = web.window.localStorage['jwt'];

String? accessToken = jwt;

class ApiDataProvider {
  /// Returns api request headers
  ///
  /// Throws an [Exception] if user session is invalid
  Map<String, String> _getRequestHeaders() {
    try {
      if (accessToken == null) {
        throw Exception("Invalid user session");
      }
      return {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
      };
    } catch (_) {
      rethrow;
    }
  }

  /// API call for fetching user details by
  /// user's email used for login
  ///
  /// An [Exception] may also be thrown if connection got interrupted
  /// or faced any issue from the backend
  Future<GetUserByEmailResponse> getUserDataByEmail(
    String email,
  ) async {
    try {
      final apiRequestHeaders = _getRequestHeaders();
      final url = Uri.parse('$appApiBaseUrl/api/user/getUserByEmail/$email');
      debugPrint("getUserDataByEmailRequest: $email");
      final response = await http.get(
        url,
        headers: apiRequestHeaders,
      );
      debugPrint("getUserDataByEmailResponse: ${response.body}");
      return GetUserByEmailResponse.fromJson(
        json.decode(response.body),
      );
    } catch (e) {
      debugPrint("getUserDataByEmailError: $e");
      rethrow;
    }
  }
}
