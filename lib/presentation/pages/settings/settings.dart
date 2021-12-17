import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/settings/settings_cubit.dart';
import '../../../configs/l10n/l10n.dart';

part 'views/settings_mobile.dart';
part 'widgets/locale_picker_dialog.dart';
part 'widgets/theme_picker_dialog.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  static MaterialPageRoute get route {
    return MaterialPageRoute(
      builder: (context) => const Settings(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _SettingsMobile();
    // return ResponsiveWidget(
    //   mobile: _SettingsMobile(),
    // );
  }
}
