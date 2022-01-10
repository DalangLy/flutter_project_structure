# project_structure

## Clone From Git
- Run Command "flutter packages pub run build_runner build --delete-conflicting-outputs" to generate file "router.gr.dart"

## Modify or Add New  App Languages
- add new or modify .arb file in "lib/config/app_locale/l10n"
- run the app to generate code
- then copy "gen_l10n" from ".dart_tool/flutter_gen" to "lib/config/app_locale/l10n"
