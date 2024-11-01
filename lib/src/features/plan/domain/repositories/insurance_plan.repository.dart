// Dart imports:
import 'dart:core';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';

abstract class InsurancePlanRepository {
  const InsurancePlanRepository();

  Future<List<InsurancePlan>> getAllInsurancePlans();

  Future<InsurancePlanDetails> getInsurancePlansDetailsById(String id);
}
