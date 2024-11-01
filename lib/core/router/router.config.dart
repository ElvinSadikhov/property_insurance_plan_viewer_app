// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/utils/extensions/build_context_extension.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/notifiers/get_insurance_plan_details.notifier.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/pages/insurance_plan_details.page.dart';

@Singleton()
class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final Map json = settings.arguments as Map? ?? {};

    switch (settings.name) {
      case InsurancePlanDetailsPage.route:
        // return MaterialPageRoute(
        //   settings: settings,
        //   builder: (BuildContext context) {
        //     return ChangeNotifierProvider(
        //       create: (context) => context.fromGetIt<GetInsurancePlanDetailsNotifier>(),
        //       child: InsurancePlanDetailsPage(
        //         planId: json['planId'],
        //       ),
        //     );
        //   }
        // );
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangeNotifierProvider(
              create: (context) => context.fromGetIt<GetInsurancePlanDetailsNotifier>(),
              child: InsurancePlanDetailsPage(
                planId: json['planId'],
              ),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
            final slideAnimation = Tween<Offset>(
              begin: const Offset(0.0, 0.1),
              end: Offset.zero,
            ).animate(animation);

            return FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: slideAnimation,
                child: child,
              ),
            );
          },
        );

      default:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
