// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/utils/extensions/build_context_extension.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/notifiers/get_insurance_plans.notifier.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/pages/insurance_plan_list.page.dart';

mixin InsurancePlanListActionsMixin on State<InsurancePlanListPage> {
  late final GetInsurancePlansNotifier getInsurancePlansNotifier;

  @override
  void initState() {
    super.initState();
    getInsurancePlansNotifier = context.fromGetIt();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getInsurancePlansNotifier.getAllPlans();
    });
  }
} 
