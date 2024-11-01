// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';

class InsurancePlanDetails extends InsurancePlan {
  final double deductible;
  final String planDescription;
  final List<String> coverageTypes;
  final List<String> exclusions;
  final String claimProcessTime;
  final double maxClaimLimit;
  final String planDuration;

  const InsurancePlanDetails({
    required super.id,
    required super.name,
    required super.coverageAmount,
    required super.monthlyPremium,
    required this.deductible,
    required this.planDescription,
    required this.coverageTypes,
    required this.exclusions,
    required this.claimProcessTime,
    required this.maxClaimLimit,
    required this.planDuration,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    coverageAmount,
    monthlyPremium,
    deductible,
    planDescription,
    coverageTypes,
    exclusions,
    claimProcessTime,
    maxClaimLimit,
    planDuration,
  ];
}
