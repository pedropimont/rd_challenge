part of 'user_repository.dart';

class _UserMockProvider implements UserRepository {
  @override
  Future<User> fetchUser({bool mockException = false}) async {
    // Mock some response delay to see the error generator message
    await Future.delayed(const Duration(seconds: 2));

    if (mockException) {
      // Mock a network error
      if (math.Random().nextBool()) {
        throw const SocketException('');
      }
    }

    final response = await http.get(Uri.parse('https://randomuser.me/api'));

    log('(TRACE) User_fetchUser: '
        'status: ${response.statusCode} \n body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'][0];

      return User.fromJson(data);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<User>> fetchUsers(
    int quantity, {
    bool mockException = false,
  }) async {
    try {
      // Mock some response delay to see the error generator message
      await Future.delayed(const Duration(seconds: 2));

      if (mockException) {
        // Mock a network error
        if (math.Random().nextBool()) {
          throw const SocketException('');
        }
      }

      final response = await http.get(
        Uri.parse('https://randomuser.me/api/?results=$quantity'),
      );

      log('(TRACE) User_fetchUser: '
          'status: ${response.statusCode} \n body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'] as List;

        return data.map((user) => User.fromJson(user)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      return const [];
    }
  }
}
