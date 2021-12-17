part of '../settings.dart';

class _SettingsMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: Column(
        children: <Widget>[
          _ThemeListTile(),
          _LocaleListTile(),
          const Divider(),
          ListTile(
            title: Text(l10n.resetDefaultSettings),
            onTap: settings.clearCache,
          ),
        ],
      ),
    );
  }
}

class _LocaleListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ListTile(
      trailing: const Icon(Icons.language),
      title: Text(l10n.languages),
      subtitle: Text(l10n.localeString()),
      onTap: () => _LanguagePickerDialog.show(context),
    );
  }
}

class _ThemeListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (p, c) => p.themeMode != c.themeMode,
      builder: (context, state) {
        String _getThemeString(ThemeMode themeMode) {
          switch (themeMode) {
            case ThemeMode.system:
              return l10n.system;
            case ThemeMode.light:
              return l10n.light;
            case ThemeMode.dark:
              return l10n.dark;
          }
        }

        return ListTile(
          trailing: const Icon(Icons.color_lens),
          title: Text(l10n.themes),
          subtitle: Text(_getThemeString(state.themeMode)),
          onTap: () => _ThemePickerDialog.show(context),
        );
      },
    );
  }
}
