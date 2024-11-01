// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan_details.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';

@Singleton()
class InsurancePlanMapper {
  InsurancePlan fromInsurancePlanDto(InsurancePlanDto dto) {
    return InsurancePlan(
      id: dto.id,
      name: dto.name,
      coverageAmount: dto.coverageAmount,
      monthlyPremium: dto.monthlyPremium,
    );
  }

  List<InsurancePlan> fromDtoList(List<InsurancePlanDto> dtos) {
    return dtos.map(fromInsurancePlanDto).toList();
  }
  
  InsurancePlanDetails fromInsurancePlanDetailsDto(InsurancePlanDetailsDto dto) {
    return InsurancePlanDetails(
      id: dto.id,
      name: dto.name,
      coverageAmount: dto.coverageAmount,
      monthlyPremium: dto.monthlyPremium,
      deductible: dto.deductible,
      planDescription: dto.planDescription,
      coverageTypes: dto.coverageTypes,
      exclusions: dto.exclusions,
      claimProcessTime: dto.claimProcessTime,
      maxClaimLimit: dto.maxClaimLimit,
      planDuration: dto.planDuration,
    );
  }
}
