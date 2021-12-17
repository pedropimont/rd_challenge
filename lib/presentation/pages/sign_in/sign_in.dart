import 'dart:io';

import 'package:cuco_challenge/configs/l10n/l10n.dart';
import 'package:cuco_challenge/presentation/widgets/show_error_snackbar.dart';
import 'package:cuco_challenge/presentation/widgets/show_loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/user/user_cubit.dart';

part 'views/sign_in_mobile.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String path = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return const _SignInMobile();
    // return ResponsiveWidget(
    //   mobile: _SignInMobile(),
    // );
  }
}
