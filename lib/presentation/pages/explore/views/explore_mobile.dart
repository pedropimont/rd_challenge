part of '../explore.dart';

class _ExploreMobile extends StatefulWidget {
  @override
  State<_ExploreMobile> createState() => _ExploreMobileState();
}

class _ExploreMobileState extends State<_ExploreMobile> {
  List<User> users = [];

  bool paginating = false;
  bool error = false;

  Future<void> paginate({bool mockException = false}) async {
    setState(() => paginating = true);

    try {
      final users = await context.read<UserRepository>().fetchUsers(
            30,
            mockException: true,
          );

      setState(() => this.users = [...this.users, ...users]);
    } catch (_) {
      setState(() => error = true);
      showErrorSnackBar(context, 'Mocked error (50% change)');
    } finally {
      setState(() => paginating = false);
    }
  }

  @override
  void initState() {
    super.initState();
    paginate(mockException: true);
  }

  Widget _buildPaginateButton() {
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
            : const Text('More'),
      ),
    );
  }

  Widget _buildBody() {
    final users = this.users;

    if (error) {
      return Center(
        child: Column(
          children: const [
            SizedBox(height: 72),
            Icon(
              Icons.error_outline,
              size: 160,
            ),
            Text('Mocked network error! (50% change)'),
          ],
        ),
      );
    }

    if (users.isEmpty) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return ListView.builder(
      itemCount: users.length + 1,
      itemBuilder: (context, i) {
        if (i == users.length) {
          return _buildPaginateButton();
        }
        return ProfileTile(user: users[i]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: _buildBody(),
    );
  }
}
