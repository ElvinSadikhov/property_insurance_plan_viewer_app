// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/api/local_insurance_plan.client.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan_details.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/mapper/insurance_plan.mapper.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/repositories/local_insurance_plan.repository.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/repositories/insurance_plan.repository.dart';

class MockLocalInsurancePlanClient extends Mock implements LocalInsurancePlanClient {}
class MockInsurancePlanMapper extends Mock implements InsurancePlanMapper {}

void main() {
  late InsurancePlanRepository repository;
  late MockLocalInsurancePlanClient mockClient;
  late MockInsurancePlanMapper mockMapper;

  setUp(() {
    mockClient = MockLocalInsurancePlanClient();
    mockMapper = MockInsurancePlanMapper();
    repository = LocalInsurancePlanRepository(mockClient, mockMapper);
  });

  group('getAllInsurancePlans', () {
    test('should return a list of InsurancePlan', () async {
      //! Arrange
      const dtos = [
        InsurancePlanDto(id: "001", name: "Basic Protection", coverageAmount: 50000.0, monthlyPremium: 25.0),
      ];
      when(() => mockClient.getAllInsurancePlans()).thenAnswer((_) async => dtos);
      when(() => mockMapper.fromDtoList(dtos)).thenReturn(const [
        InsurancePlan(id: "001", name: "Basic Protection", coverageAmount: 50000.0, monthlyPremium: 25.0),
      ]);

      //! Act
      final result = await repository.getAllInsurancePlans();

      //! Assert
      expect(result, isA<List<InsurancePlan>>());
      expect(result.length, equals(1));
      verify(() => mockClient.getAllInsurancePlans()).called(1);
    });
  });

  group('getInsurancePlansDetailsById', () {
    test('should return InsurancePlanDetails when valid id is provided', () async {
      //! Arrange
      const id = "001";
      const dto = InsurancePlanDetailsDto(
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
      when(() => mockClient.getInsurancePlanDetails(id)).thenAnswer((_) async => dto);
      when(() => mockMapper.fromInsurancePlanDetailsDto(dto)).thenReturn(
        const InsurancePlanDetails(
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
        ),
      );

      //! Act
      final result = await repository.getInsurancePlansDetailsById(id);

      //! Assert
      expect(result, isA<InsurancePlanDetails>());
      expect(result.id, equals(id));
      verify(() => mockClient.getInsurancePlanDetails(id)).called(1);
    });

    test('should throw an exception when an invalid id is provided', () async {
      //! Arrange
      const invalidId = "999";
      when(() => mockClient.getInsurancePlanDetails(invalidId)).thenThrow(Exception("Insurance plan not found"));

      //! Act
      Future<void> act() => repository.getInsurancePlansDetailsById(invalidId);

      //! Assert
      expect(act, throwsException);
      verify(() => mockClient.getInsurancePlanDetails(invalidId)).called(1);
    });
  });
}
