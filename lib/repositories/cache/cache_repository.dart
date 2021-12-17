import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories.dart';

part 'shared_preferences_provider.dart';

abstract class CacheRepository implements BaseRepository {
  static Future<CacheRepository> getInstance() async {
    return _SharedPreferencesProvider.getInstance();
  }

  Locale? get locale;
  ThemeMode? get themeMode;

  Future<bool> saveThemeMode(ThemeMode themeMode);
  Future<bool> saveLocale(Locale locale);

  Future<bool> clear();
}
