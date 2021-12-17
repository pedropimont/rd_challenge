import 'dart:io';

import 'package:cuco_challenge/presentation/widgets/show_error_snackbar.dart';
import 'package:cuco_challenge/repositories/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../widgets/profile_tile.dart';

part 'views/explore_mobile.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  static MaterialPageRoute get route {
    return MaterialPageRoute(
      builder: (context) => const Explore(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ExploreMobile();
    // return ResponsiveWidget(
    //   mobile: _SettingsMobile(),
    // );
  }
}
