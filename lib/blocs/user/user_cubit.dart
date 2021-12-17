import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import '../../repositories/user/user_repository.dart';

class UserCubit extends Cubit<User?> {
  final UserRepository userRepository;

  late StreamSubscription followersStream;

  UserCubit(BuildContext context)
      : userRepository = context.read<UserRepository>(),
        super(null) {
    followersStream =
        Stream.periodic(const Duration(seconds: 10)).listen((_) async {
      final follower = await userRepository.fetchUser();

      final followers = [follower, ...?state?.followers];

      emit(state?.copyWith(followers: followers));
    });
  }

  Future<void> follow(User user) async {
    // Mocked delay
    await Future.delayed(const Duration(milliseconds: 500));

    final following = [user, ...?state?.following];

    emit(state?.copyWith(following: following));
  }

  Future<void> unfollow(User user) async {
    // Mocked delay
    await Future.delayed(const Duration(milliseconds: 500));

    final following = state?.following.where((_user) {
      return _user.id != user.id;
    }).toList();

    emit(state?.copyWith(following: following));
  }

  Future<void> signInAnonymously() async {
    final user = await userRepository.fetchUser(mockException: true);
    emit(user);
  }

  void signOut() => emit(null);
}
