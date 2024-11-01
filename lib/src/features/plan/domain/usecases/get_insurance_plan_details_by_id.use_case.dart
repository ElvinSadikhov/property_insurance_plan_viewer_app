// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/common/domain/usecases/usecase.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/repositories/insurance_plan.repository.dart';

@injectable
class GetInsurancePlanDetailByIdUseCase extends UsecaseWithParams<InsurancePlanDetails, GetInsurancePlanDetailByIdParams> {
  final InsurancePlanRepository _insurancePlanRepository;

  GetInsurancePlanDetailByIdUseCase(this._insurancePlanRepository);

  @override
  Future<InsurancePlanDetails> call(GetInsurancePlanDetailByIdParams params) {
    return _insurancePlanRepository.getInsurancePlansDetailsById(params.id);
  }
}

class GetInsurancePlanDetailByIdParams extends UsecaseParams {
  final String id;

  const GetInsurancePlanDetailByIdParams(this.id);
}