// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'insurance_plan.dto.g.dart';

@JsonSerializable()
class InsurancePlanDto {
  final String id;
  final String name;
  final double coverageAmount;
  final double monthlyPremium;

  const InsurancePlanDto({
    required this.id,
    required this.name,
    required this.coverageAmount,
    required this.monthlyPremium,
  });

  Map<String, dynamic> toJson() => _$InsurancePlanDtoToJson(this);
}