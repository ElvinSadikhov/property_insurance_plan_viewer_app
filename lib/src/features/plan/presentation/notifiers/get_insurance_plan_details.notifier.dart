// Package imports:
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/error/failures/failure.dart';
import 'package:property_insurance_plan_viewer_app/core/notifier/base.notifier.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/usecases/get_insurance_plan_details_by_id.use_case.dart';

@Injectable()
class GetInsurancePlanDetailsNotifier extends BaseNotifier<InsurancePlanDetails> {
  final GetInsurancePlanDetailByIdUseCase _getInsurancePlanDetailByIdUseCase;

  GetInsurancePlanDetailsNotifier(this._getInsurancePlanDetailByIdUseCase);

  Future<Either<Failure, InsurancePlanDetails>> getPlanById(String id) {
    return getResponse((_) => _getInsurancePlanDetailByIdUseCase(GetInsurancePlanDetailByIdParams(id)));
  }
}
