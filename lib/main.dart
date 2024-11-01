// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/config/main.config.dart';
import 'package:property_insurance_plan_viewer_app/app.dart';

Future<void> main() async {
  await MainConfigurations.configure();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const PlanViewerApp(),
    ),
  );
}
