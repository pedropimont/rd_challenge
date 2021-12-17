part of '../settings.dart';

class _ThemePickerDialog extends StatelessWidget {
  final SettingsCubit settings;
  const _ThemePickerDialog._(this.settings);

  static Future<Widget>? show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _ThemePickerDialog._(context.read<SettingsCubit>()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final _currentTheme = settings.state.themeMode;

    void _setTheme(ThemeMode? themeMode) {
      if (themeMode != null) settings.changeThemeMode(themeMode);
      Navigator.of(context).pop();
    }

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile(
            title: Text(l10n.system),
            value: ThemeMode.system,
            groupValue: _currentTheme,
            onChanged: _setTheme,
            selected: _currentTheme == ThemeMode.system,
          ),
          RadioListTile(
            title: Text(l10n.light),
            value: ThemeMode.light,
            groupValue: _currentTheme,
            onChanged: _setTheme,
            selected: _currentTheme == ThemeMode.light,
          ),
          RadioListTile(
            title: Text(l10n.dark),
            value: ThemeMode.dark,
            groupValue: _currentTheme,
            onChanged: _setTheme,
            selected: _currentTheme == ThemeMode.dark,
          ),
        ],
      ),
    );
  }
}
