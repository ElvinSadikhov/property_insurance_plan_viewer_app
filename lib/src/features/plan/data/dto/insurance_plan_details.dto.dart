// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'insurance_plan_details.dto.g.dart';

@JsonSerializable()
class InsurancePlanDetailsDto {
  final String id;
  final String name;
  final double coverageAmount;
  final double monthlyPremium;
  final double deductible;
  final String planDescription;
  final List<String> coverageTypes;
  final List<String> exclusions;
  final String claimProcessTime;
  final double maxClaimLimit;
  final String planDuration;

  const InsurancePlanDetailsDto({
    required this.id,
    required this.name,
    required this.coverageAmount,
    required this.monthlyPremium,
    required this.deductible,
    required this.planDescription,
    required this.coverageTypes,
    required this.exclusions,
    required this.claimProcessTime,
    required this.maxClaimLimit,
    required this.planDuration,
  });

  Map<String, dynamic> toJson() => _$InsurancePlanDetailsDtoToJson(this);
}