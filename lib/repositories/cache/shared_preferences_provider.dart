part of 'cache_repository.dart';

const String _themeModeIndexKey = 'themeModeIndex';
const String _languageCodeKey = 'languageCode';
const String _countryCodeKey = 'countryCode';

class _SharedPreferencesProvider implements CacheRepository {
  static _SharedPreferencesProvider? _instance;
  final SharedPreferences _sharedPreferences;

  static Future<_SharedPreferencesProvider> getInstance() async {
    if (_instance == null) {
      final sharedPreferences = await SharedPreferences.getInstance();
      _instance = _SharedPreferencesProvider._(sharedPreferences);
    }
    return _instance!;
  }

  _SharedPreferencesProvider._(SharedPreferences sharedPreferences)
      : _sharedPreferences = sharedPreferences;

  bool? _getBool(String key) => _sharedPreferences.getBool(key);

  int? _getInt(String key) => _sharedPreferences.getInt(key);

  String? _getString(String key) => _sharedPreferences.getString(key);

  Set<String> _getKeys() => _sharedPreferences.getKeys();

  Future<bool> _remove(String key) async => _sharedPreferences.remove(key);

  Future<bool> _save<T>(String key, T content) async {
    log('(TRACE) CacheProvider_save. key: $key value: $content');
    if (content is String) {
      return await _sharedPreferences.setString(key, content);
    }
    if (content is bool) {
      return await _sharedPreferences.setBool(key, content);
    }
    if (content is int) {
      return await _sharedPreferences.setInt(key, content);
    }
    if (content is double) {
      return await _sharedPreferences.setDouble(key, content);
    }
    if (content is List<String>) {
      return await _sharedPreferences.setStringList(key, content);
    }
    throw Exception(
      'CacheProvider_save: Type: ${content.runtimeType} not supported',
    );
  }

  @override
  Locale? get locale {
    final languageCode = _getString(_languageCodeKey);
    if (languageCode == null) return null;
    return Locale(languageCode, _getString(_countryCodeKey));
  }

  @override
  ThemeMode? get themeMode {
    final themeModeIndex = _getInt(_themeModeIndexKey);
    if (themeModeIndex == null) return null;
    return ThemeMode.values[themeModeIndex];
  }

  @override
  Future<bool> saveThemeMode(ThemeMode themeMode) async {
    return await _save(_themeModeIndexKey, themeMode.index);
  }

  @override
  Future<bool> saveLocale(Locale locale) async {
    var result = true;
    if (!await _save(_languageCodeKey, locale.languageCode)) result = false;
    if (!await _save(_countryCodeKey, locale.countryCode)) result = false;
    return result;
  }

  @override
  Future<bool> clear() async {
    // return await _sharedPreferences.clear();
    var result = true;
    final keySet = _getKeys();
    for (final key in keySet) {
      if (!await _remove(key)) {
        log('(TRACE) Cache_clear: key: $key was not removed from disk cache');
        result = false;
      }
      log('key: $key was removed from disk cache');
    }
    return result;
  }
}
