part of '../sign_in.dart';

class _SignInMobile extends StatelessWidget {
  const _SignInMobile({Key? key}) : super(key: key);

  Future<void> onSignInPressed(BuildContext context) async {
    try {
      showLoadingDialog(
        context,
        '2 seconds mock delay',
      );
      await context.read<UserCubit>().signInAnonymously();
    } on SocketException {
      Navigator.pop(context);
      showErrorSnackBar(
        context,
        'Mocked network error!',
      );
    } catch (_) {
      Navigator.pop(context);
      showErrorSnackBar(
        context,
        'There was an unknown error',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const FlutterLogo(size: 160),
            Text(
              l10n.appTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () => onSignInPressed(context),
              child: const Text('Sign In Anonymously'),
            )
          ],
        ),
      ),
    );
  }
}
