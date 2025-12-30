import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template_web/core/constants.dart';
import "package:http/http.dart" as http;
import 'package:flutter_template_web/models/api_models/get_user_by_email_response.dart';
import 'package:flutter_template_web/providers/api_data_provider.dart';
import 'package:flutter_template_web/utils/app_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';

const String _inactiveUserMsg =
    "User is inactive. Please contact system admin.";

class LoginProvider extends ChangeNotifier {
  /// Initializes [LoginProvider]
  ///
  /// Must be initialized before using any of the method of this class
  ///
  late ApiDataProvider _apiDataProvider;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['openid', 'email', 'profile'],
      clientId:
          "215452610031-lmin8bo9k2ojas70sp0d6i0u51r9v00a.apps.googleusercontent.com");

  GetUserByEmail? _userDetails;

  GetUserByEmail? get userDetails => _userDetails;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get isAuthenticated =>
      _userDetails != null &&
      _userDetails!.email != null &&
      _userDetails!.googleId != null;

  LoginProvider(
    ApiDataProvider apiDataProvider,
  ) {
    _apiDataProvider = apiDataProvider;
  }

  Future<void> getUserDetails(String email) async {
    try {
      final res = await _apiDataProvider.getUserDataByEmail(
        email,
      );
      if (res.resbody?.isNotEmpty == true) {
        if (res.resbody?.first.googleId == null ||
            res.resbody?.first.googleId == "") {
          throw appException(_inactiveUserMsg);
        }
        _userDetails = res.resbody?.first;
      } else {
        throw appException(res.message);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount? user = await _googleSignIn.signIn();

      if (user == null) return;

      final auth = await user.authentication;
      final response = await http.post(
        Uri.parse("$apiBaseUrl/api/user/google"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"accessToken": auth.accessToken}),
      );

      if (response.statusCode != 200) {
        throw Exception("Backend login failed");
      }

      final data = jsonDecode(response.body);
      final jwt = data['token'];

      if (kIsWeb) {
        web.window.localStorage['jwt'] = jwt;
      } else {
        const storage = FlutterSecureStorage();
        await storage.write(key: "jwt", value: jwt);
      }
      _isLoading = true;
      notifyListeners();

      await getUserDetails(user.email);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Login error: $e");
    }
  }

  Future<void> signIn(String email) async {
    try {
      await getUserDetails(email);
      final isLoggedIn =
          _userDetails?.email != null && _userDetails?.googleId != null;
      _isLoading = isLoggedIn ? false : true;
      notifyListeners();
    } catch (_) {
      appException("Login failed. Please try again.");
      rethrow;
    }
  }

  // Initialization code here
}
