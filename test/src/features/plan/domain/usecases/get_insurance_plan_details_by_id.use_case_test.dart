// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/repositories/insurance_plan.repository.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/usecases/get_insurance_plan_details_by_id.use_case.dart';

class MockInsurancePlanRepository extends Mock implements InsurancePlanRepository {}

void main() {
  late GetInsurancePlanDetailByIdUseCase useCase;
  late MockInsurancePlanRepository mockRepository;

  setUp(() {
    mockRepository = MockInsurancePlanRepository();
    useCase = GetInsurancePlanDetailByIdUseCase(mockRepository);
  });

  test('should return InsurancePlanDetails when repository returns data for valid ID', () async {
    //! Arrange
    const id = "001";
    const insurancePlanDetails = InsurancePlanDetails(
      id: id,
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
    );
    when(() => mockRepository.getInsurancePlansDetailsById(id)).thenAnswer((_) async => insurancePlanDetails);

    //! Act
    final result = await useCase(const GetInsurancePlanDetailByIdParams(id));

    //! Assert
    expect(result, equals(insurancePlanDetails));
    verify(() => mockRepository.getInsurancePlansDetailsById(id)).called(1);
  });

  test('should throw an error when repository does not find data for invalid ID', () async {
    //! Arrange
    const id = "invalid_id";
    when(() => mockRepository.getInsurancePlansDetailsById(id)).thenThrow(Exception("Plan not found"));

    //! Act
    Future<void> act() async => await useCase(const GetInsurancePlanDetailByIdParams(id));

    //! Assert
    expect(act, throwsException);
    verify(() => mockRepository.getInsurancePlansDetailsById(id)).called(1);
  });
}
