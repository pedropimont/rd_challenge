import 'package:cuco_challenge/blocs/user/user_cubit.dart';
import 'package:cuco_challenge/presentation/widgets/profile_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';

part 'views/account_mobile.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  static MaterialPageRoute get route {
    return MaterialPageRoute(
      builder: (context) => const Account(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _AccountMobile();
    // return ResponsiveWidget(
    //   mobile: _SettingsMobile(),
    // );
  }
}
