import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user/user_cubit.dart';
import '../../models/user.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.photoURL),
      ),
      title: Text(user.name),
      subtitle: Text('@${user.username}'),
      trailing: _TileButton(user: user),
    );
  }
}

class _TileButton extends StatefulWidget {
  const _TileButton({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<_TileButton> createState() => _TileButtonState();
}

class _TileButtonState extends State<_TileButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(
      builder: (context, _mainUser) {
        final user = widget.user;

        final mainUser = _mainUser!;

        final isFollowing = mainUser.following.contains(user);

        void _action() async {
          setState(() => loading = true);

          isFollowing
              ? await context.read<UserCubit>().unfollow(user)
              : await context.read<UserCubit>().follow(user);

          setState(() => loading = false);
        }

        Widget _buildChild() {
          if (loading) {
            return const SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator.adaptive(strokeWidth: 3),
            );
          }

          return Text(isFollowing ? 'Unfollow' : 'Follow');
        }

        if (isFollowing) {
          return OutlinedButton(
            onPressed: _action,
            child: _buildChild(),
          );
        }

        return ElevatedButton(
          onPressed: _action,
          child: _buildChild(),
        );
      },
    );
  }
}
