part of '../explore.dart';

class _ExploreMobile extends StatefulWidget {
  @override
  State<_ExploreMobile> createState() => _ExploreMobileState();
}

class _ExploreMobileState extends State<_ExploreMobile> {
  List<User>? users;

  bool paginating = false;

  Future<void> paginate({bool mockException = false}) async {
    setState(() => paginating = true);
    final users = await context.read<UserRepository>().fetchUsers(30);

    setState(() {
      paginating = false;
      this.users = [...?this.users, ...users];
    });
  }

  @override
  void initState() {
    super.initState();
    paginate(mockException: true);
  }

  Widget _buildBody() {
    final users = this.users;

    if (users == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (users.isEmpty) {
      return const Center(
        child: Text('A 1 in two change mocked error has occurred'),
      );
    }

    return ListView.builder(
      itemCount: users.length + 1,
      itemBuilder: (context, i) {
        if (i == users.length) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: paginating ? null : paginate,
              child: paginating
                  ? const SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator.adaptive(
                        strokeWidth: 2,
                      ),
                    )
                  : Text('More'),
            ),
          );
        }

        final user = users[i];

        return ProfileTile(user: user);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore')),
      body: _buildBody(),
    );
  }
}
