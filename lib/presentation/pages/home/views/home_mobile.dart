part of '../home.dart';

class _HomeMobile extends StatefulWidget {
  const _HomeMobile({Key? key}) : super(key: key);

  @override
  State<_HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<_HomeMobile> {
  Point? position;
  double size = 72;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        position = Point(
          MediaQuery.of(context).size.width / 2,
          MediaQuery.of(context).size.height / 2,
        );
      });
    });
  }

  void onCucoClick() {
    setState(() {
      position = Point(
        (MediaQuery.of(context).size.width - 80) * Random().nextDouble(),
        (MediaQuery.of(context).size.height - 160) * Random().nextDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            left: position?.x.toDouble(),
            bottom: position?.y.toDouble(),
            child: GestureDetector(
              onTap: onCucoClick,
              child: Column(children: [
                Image.asset(
                  'assets/images/cuco_logo.png',
                  width: size,
                ),
                const SizedBox(height: 8),
                Text(
                  'Click Me!',
                  style: Theme.of(context).textTheme.headline6,
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
