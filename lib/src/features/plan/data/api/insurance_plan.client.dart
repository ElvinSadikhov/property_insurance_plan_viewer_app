// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan_details.dto.dart';

abstract class InsurancePlanClient {
  Future<List<InsurancePlanDto>> getAllInsurancePlans();

  Future<InsurancePlanDetailsDto> getInsurancePlanDetails(String id);
}
