part of '../home.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<UserCubit, User?>(
      builder: (context, _user) {
        final user = _user!;

        return Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL),
                ),
                accountName: Text(user.username),
                accountEmail: Text(user.email),
              ),
              ListTile(
                onTap: () => Navigator.push(context, Account.route),
                leading: const Icon(Icons.person),
                title: const Text('Account'),
              ),
              ListTile(
                onTap: () => Navigator.push(context, Explore.route),
                leading: const Icon(Icons.explore),
                title: const Text('Explore'),
              ),
              ListTile(
                onTap: () => Navigator.push(context, Settings.route),
                leading: const Icon(Icons.settings),
                title: Text(l10n.settings),
              ),
              const Divider(),
              ListTile(
                onTap: () => context.read<UserCubit>().signOut(),
                leading: const Icon(Icons.logout),
                title: const Text('Sign out'),
              ),
            ],
          ),
        );
      },
    );
  }
}
