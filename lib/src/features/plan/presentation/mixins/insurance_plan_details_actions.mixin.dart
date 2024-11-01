// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/notifiers/get_insurance_plan_details.notifier.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/presentation/pages/insurance_plan_details.page.dart';

mixin InsurancePlanListActionsMixin on State<InsurancePlanDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetInsurancePlanDetailsNotifier>().getPlanById(widget.planId);
    });
  }

} 
