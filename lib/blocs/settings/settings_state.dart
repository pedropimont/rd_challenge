part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final Locale? locale;
  final ThemeMode themeMode;

  const SettingsState({
    this.locale,
    ThemeMode? themeMode,
  }) : themeMode = themeMode ?? ThemeMode.system;

  SettingsState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        themeMode,
      ];
}
