// Dart imports:
import 'dart:async';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/api/insurance_plan.client.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/mapper/insurance_plan.mapper.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/repositories/insurance_plan.repository.dart';

@Singleton(as: InsurancePlanRepository)
class LocalInsurancePlanRepository extends InsurancePlanRepository {
  final InsurancePlanClient _insurancePlanClient;
  final InsurancePlanMapper _insurancePlanMapper;

  LocalInsurancePlanRepository(
    this._insurancePlanClient,
    this._insurancePlanMapper,
  );

  @override
  Future<List<InsurancePlan>> getAllInsurancePlans() async {
    final dtos = await _insurancePlanClient.getAllInsurancePlans();
    return _insurancePlanMapper.fromDtoList(dtos);
  }

  @override
  Future<InsurancePlanDetails> getInsurancePlansDetailsById(String id) async {
    final dto = await _insurancePlanClient.getInsurancePlanDetails(id);
    return _insurancePlanMapper.fromInsurancePlanDetailsDto(dto);
  }
}
