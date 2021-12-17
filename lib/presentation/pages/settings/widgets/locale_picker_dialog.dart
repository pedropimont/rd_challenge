part of '../settings.dart';

class _LanguagePickerDialog extends StatelessWidget {
  final SettingsCubit settings;
  const _LanguagePickerDialog._(this.settings);

  static Future<Widget>? show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _LanguagePickerDialog._(context.read<SettingsCubit>()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    void _changeLocale(Locale locale) {
      settings.changeLocale(locale);
      Navigator.pop(context);
    }

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(l10n.localeString('en_US')),
            onTap: () => _changeLocale(const Locale('en', 'US')),
          ),
          ListTile(
            title: Text(l10n.localeString('pt_BR')),
            onTap: () => _changeLocale(const Locale('pt', 'BR')),
          ),
        ],
      ),
    );
  }
}
