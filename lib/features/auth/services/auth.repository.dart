import 'dart:io';

import 'package:boilerplate/features/auth/models/auth.model.dart';
import 'package:boilerplate/features/auth/models/user.model.dart';
import 'package:boilerplate/repositories/_base.repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// It takes an email and password, sends them to the server, and returns the
///  response

@LazySingleton()
class AuthRepository extends BaseRepository {
  /// It takes an email and password, sends them to the server, and returns the
  /// response
  ///
  /// Args:
  ///   email (String): The email address of the user.
  ///   password (String): The password of the user.
  ///
  /// Returns:
  ///   AuthResponse
  Future<User> login(AuthLoginArgs args) async {
    try {
      final response =
          await api.post(ApiEndpoints.AuthLogin.path, data: args.toJson());

      if (response.statusCode == HttpStatus.ok) {
        final data = User.fromJson(response.data as Map<String, dynamic>);

        return data;
      }

      throw Exception();
    } on DioError {
      rethrow;
    }
  }
}
