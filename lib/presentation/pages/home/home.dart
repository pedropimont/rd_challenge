import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user/user_cubit.dart';
import '../../../configs/l10n/l10n.dart';
import '../../../models/user.dart';
import '../account/account.dart';
import '../explore/explore.dart';
import '../settings/settings.dart';

part 'views/home_mobile.dart';
part 'widgets/app_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return const _HomeMobile();
    // return ResponsiveWidget(
    //   mobile: _SignedHomeMobile(),
    // );
  }
}
