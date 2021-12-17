import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'blocs/settings/settings_cubit.dart';
import 'blocs/user/user_cubit.dart';
import 'models/user.dart';
import 'presentation/pages/home/home.dart';
import 'presentation/pages/sign_in/sign_in.dart';
import 'repositories/cache/cache_repository.dart';
import 'repositories/user/user_repository.dart';

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App({
    Key? key,
    required this.cacheRepository,
  }) : super(key: key);

  final CacheRepository cacheRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: cacheRepository),
        RepositoryProvider(create: (_) => UserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SettingsCubit(context)),
          BlocProvider(create: (context) => UserCubit(context)),
        ],
        child: const _App(),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (_, config) {
        return MaterialApp(
          restorationScopeId: 'app',
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: config.themeMode,
          locale: config.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          onGenerateTitle: (context) {
            return AppLocalizations.of(context)!.appTitle;
          },
          home: BlocConsumer<UserCubit, User?>(
            listenWhen: (p, c) => p?.id != c?.id,
            listener: (context, user) {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            builder: (_, user) => user == null ? const SignIn() : const Home(),
          ),
        );
      },
    );
  }
}
