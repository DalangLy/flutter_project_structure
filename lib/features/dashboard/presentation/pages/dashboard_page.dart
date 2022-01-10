import 'package:flutter/material.dart';
import 'package:project_structure/config/app_locale/l10n/gen_l10n/app_localizations.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(AppLocalizations.of(context)!.dashboard, style: Theme.of(context).textTheme.headline3,),
        ),
      ),
    );
  }
}
