// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/router/router.config.dart';
import 'package:property_insurance_plan_viewer_app/core/theme/plan_viewer.theme.dart';
import 'package:property_insurance_plan_viewer_app/core/translations/locale_keys.g.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/pages/insurance_plan_list.page.dart';

class PlanViewerApp extends StatefulWidget {
  const PlanViewerApp({super.key});

  @override
  State<PlanViewerApp> createState() => _PlanViewerAppState();
}

class _PlanViewerAppState extends State<PlanViewerApp> {
  final _routeGenerator = GetIt.instance.get<RouteGenerator>();

  @override
  Widget build(BuildContext context) {
    final theme = PlanViewerTheme(context);

    return Provider(
      create: (_) => GetIt.instance,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: LocaleKeys.appName.tr(),
        theme: theme.lightTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateTitle: (context) => LocaleKeys.appName.tr(),
        routes: _appRoutes,
        onGenerateRoute: _routeGenerator.generateRoute,
        home: const InsurancePlanListPage(),
      ),
    );
  }

  Map<String, WidgetBuilder> get _appRoutes {
    return <String, WidgetBuilder>{

    };
  }
}
