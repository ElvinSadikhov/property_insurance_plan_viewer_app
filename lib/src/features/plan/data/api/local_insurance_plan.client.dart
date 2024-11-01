// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/api/insurance_plan.client.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan_details.dto.dart';

@LazySingleton(as: InsurancePlanClient)
class LocalInsurancePlanClient implements InsurancePlanClient {
  
  @override
  Future<List<InsurancePlanDto>> getAllInsurancePlans() async {
    await Future.delayed(const Duration(seconds: 1));
    return _plans.map((e) => InsurancePlanDto(
      id: e.id,
      name: e.name,
      coverageAmount: e.coverageAmount,
      monthlyPremium: e.monthlyPremium,
    )).toList();
  }

  @override
  Future<InsurancePlanDetailsDto> getInsurancePlanDetails(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _plans.firstWhere((element) => element.id == id);
  }

  final List<InsurancePlanDetailsDto> _plans = const [
    InsurancePlanDetailsDto(
      id: "001",
      name: "Basic Protection",
      coverageAmount: 50000.0,
      monthlyPremium: 25.0,
      deductible: 500.0,
      planDescription: "Basic coverage for fire and theft.",
      coverageTypes: ["Fire Damage", "Theft"],
      exclusions: ["Flood Damage", "Earthquakes"],
      claimProcessTime: "14 days",
      maxClaimLimit: 100000.0,
      planDuration: "1 year",
    ),
    InsurancePlanDetailsDto(
      id: "002",
      name: "Standard Protection",
      coverageAmount: 100000.0,
      monthlyPremium: 50.0,
      deductible: 750.0,
      planDescription: "Extended coverage for fire, theft, and natural disasters.",
      coverageTypes: ["Fire Damage", "Theft", "Natural Disasters"],
      exclusions: ["War-related Damages"],
      claimProcessTime: "10 days",
      maxClaimLimit: 200000.0,
      planDuration: "2 years",
    ),
    InsurancePlanDetailsDto(
      id: "003",
      name: "Premium Coverage",
      coverageAmount: 200000.0,
      monthlyPremium: 100.0,
      deductible: 1000.0,
      planDescription: "Comprehensive coverage including accidental damage.",
      coverageTypes: ["Fire Damage", "Theft", "Natural Disasters", "Accidental Damage"],
      exclusions: ["Intentional Damage"],
      claimProcessTime: "7 days",
      maxClaimLimit: 500000.0,
      planDuration: "3 years",
    ),
  ];
}
