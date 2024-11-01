// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/common/domain/usecases/usecase.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/repositories/insurance_plan.repository.dart';

@injectable
class GetAllInsurancePlansUseCase extends UsecaseWithoutParams<List<InsurancePlan>> {
  final InsurancePlanRepository _insurancePlanRepository;

  GetAllInsurancePlansUseCase(this._insurancePlanRepository);

  @override
  Future<List<InsurancePlan>> call() {
    return _insurancePlanRepository.getAllInsurancePlans();
  }
}
