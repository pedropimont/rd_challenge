import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:http/http.dart' as http;

import '../../models/user.dart';
import '../repositories.dart';

part 'user_mock_provider.dart';

abstract class UserRepository extends BaseRepository {
  static UserRepository? _instance;

  factory UserRepository() {
    _instance ??= _UserMockProvider();
    return _instance!;
  }

  Future<User> fetchUser({bool mockException});

  Future<List<User>> fetchUsers(int quantity, {bool mockException});
}
