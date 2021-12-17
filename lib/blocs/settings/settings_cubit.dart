import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/cache/cache_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  factory SettingsCubit(BuildContext context) {
    return SettingsCubit._(context.read<CacheRepository>());
  }

  SettingsCubit._(this._cache)
      : super(SettingsState(
          locale: _cache.locale,
          themeMode: _cache.themeMode,
        ));

  final CacheRepository _cache;

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    emit(state.copyWith(themeMode: themeMode));
    await _cache.saveThemeMode(themeMode);
  }

  Future<void> changeLocale(Locale locale) async {
    emit(state.copyWith(locale: locale));
    await _cache.saveLocale(locale);
  }

  Future<void> clearCache() async {
    emit(const SettingsState());
    await _cache.clear();
  }
}
