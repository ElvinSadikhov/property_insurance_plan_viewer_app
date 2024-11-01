# README #

This README would normally document whatever steps are necessary to get application up and running.

## How do I get set up? ##

### Install packages ###

Run `pub get`

### Generate files ###

1. To generate most of required files run `dart run build_runner build`
   1. if you run into conflicts try running `dart run build_runner build --delete-conflicting-outputs`
2. To generate translation keys use:
    `dart run easy_localization:generate --source-dir "assets/translations" --output-dir "lib/core/translations" --output-file "locale_keys.g.dart" --format keys`

### Run project ###

Use `flutter run` or use your IDE tools to launch project normally

### Contribution ###

Before any commit or PR, run `dart run import_sorter:main lib\/*`