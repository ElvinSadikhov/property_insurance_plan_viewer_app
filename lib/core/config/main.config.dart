// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/config/di.dart';

abstract class MainConfigurations {
  static Future<void> configure() async { 
    WidgetsFlutterBinding.ensureInitialized();

    await configureDependencies(Flavor.dev);
    await EasyLocalization.ensureInitialized();
  }
}
