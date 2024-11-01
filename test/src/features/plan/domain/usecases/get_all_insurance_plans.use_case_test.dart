// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/repositories/insurance_plan.repository.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/usecases/get_all_insurance_plans.use_case.dart';

class MockInsurancePlanRepository extends Mock implements InsurancePlanRepository {}

void main() {
  late GetAllInsurancePlansUseCase useCase;
  late MockInsurancePlanRepository mockRepository;

  setUp(() {
    mockRepository = MockInsurancePlanRepository();
    useCase = GetAllInsurancePlansUseCase(mockRepository);
  });

  test('should return a list of InsurancePlan when repository returns data', () async {
    //! Arrange
    const insurancePlans = [
      InsurancePlan(id: "001", name: "Basic Protection", coverageAmount: 50000.0, monthlyPremium: 25.0),
      InsurancePlan(id: "002", name: "Standard Protection", coverageAmount: 100000.0, monthlyPremium: 50.0),
    ];
    when(() => mockRepository.getAllInsurancePlans()).thenAnswer((_) async => insurancePlans);

    //! Act
    final result = await useCase();

    //! Assert
    expect(result, equals(insurancePlans));
    verify(() => mockRepository.getAllInsurancePlans()).called(1);
  });

  test('should throw an exception when repository fails', () async {
    //! Arrange
    when(() => mockRepository.getAllInsurancePlans()).thenThrow(Exception("Failed to fetch plans"));

    //! Act
    Future<void> act() async => await useCase();

    //! Assert
    expect(act, throwsException);
    verify(() => mockRepository.getAllInsurancePlans()).called(1);
  });
}
