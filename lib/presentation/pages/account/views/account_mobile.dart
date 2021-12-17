part of '../account.dart';

class _AccountMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(
      builder: (context, _user) {
        final user = _user!;

        return Scaffold(
          appBar: AppBar(
            title: Text('Account'),
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 8),
                CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL),
                  radius: 72,
                ),
                const SizedBox(height: 8),
                Text(
                  '@${user.username}',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Button(
                      label: 'Following',
                      users: user.following,
                    ),
                    const SizedBox(width: 16),
                    _Button(
                      label: 'Followers',
                      users: user.followers,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.label,
    required this.users,
  }) : super(key: key);

  final String label;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        showUsersModalBottomSheet(context, users);
      },
      icon: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.25),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            '${users.length}',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
      label: Text(label),
    );
  }
}

void showUsersModalBottomSheet(BuildContext context, List<User> users) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) {
          final user = users[i];

          return ProfileTile(user: user);
        },
      );
    },
  );
}
