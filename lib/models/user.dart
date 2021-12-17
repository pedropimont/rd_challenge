import 'package:equatable/equatable.dart';

enum Gender { female, male }

class User extends Equatable {
  final String id;
  final String email;
  final String username;

  final String name;
  final Gender gender;
  final DateTime dob;
  final String photoURL;

  final List<User> following;
  final List<User> followers;

  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.name,
    required this.gender,
    required this.photoURL,
    required this.dob,
    required this.following,
    required this.followers,
  });

  User.fromJson(Map<String, dynamic> data)
      : id = data['login']['uuid'],
        email = data['email'],
        username = data['login']['username'],
        name = '${data['name']['first']} ${data['name']['last']}',
        gender = Gender.values.byName(data['gender']),
        dob = DateTime.parse(data['dob']['date']),
        photoURL = data['picture']['large'],
        following = const [],
        followers = const [];

  User copyWith({
    String? username,
    String? name,
    Gender? gender,
    DateTime? dob,
    String? photoURL,
    List<User>? following,
    List<User>? followers,
  }) {
    return User(
      id: id,
      email: email,
      username: username ?? this.username,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      photoURL: photoURL ?? this.photoURL,
      dob: dob ?? this.dob,
      following: following ?? this.following,
      followers: followers ?? this.followers,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        dob,
        photoURL,
        following,
        followers,
      ];
}
