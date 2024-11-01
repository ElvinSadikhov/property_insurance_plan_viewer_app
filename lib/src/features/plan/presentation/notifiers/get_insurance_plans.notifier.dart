// Package imports:
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/core/error/failures/failure.dart';
import 'package:property_insurance_plan_viewer_app/core/notifier/base.notifier.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/usecases/get_all_insurance_plans.use_case.dart';

@Injectable()
class GetInsurancePlansNotifier extends BaseNotifier<List<InsurancePlan>> {
  final GetAllInsurancePlansUseCase _getAllInsurancePlansUseCase;

  GetInsurancePlansNotifier(this._getAllInsurancePlansUseCase);

  Future<Either<Failure, List<InsurancePlan>>> getAllPlans() {
    return getResponse((_) => _getAllInsurancePlansUseCase());
  }
}
