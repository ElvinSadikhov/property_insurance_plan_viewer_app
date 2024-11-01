// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/dto/insurance_plan_details.dto.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/data/mapper/insurance_plan.mapper.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan.dart';
import 'package:property_insurance_plan_viewer_app/src/features/plan/domain/entities/insurance_plan_details.dart';

void main() {
  late InsurancePlanMapper mapper;

  setUp(() {
    mapper = InsurancePlanMapper();
  });

  group('fromInsurancePlanDto', () {
    test('should convert InsurancePlanDto to InsurancePlan', () {
      //! Arrange
      const dto = InsurancePlanDto(
        id: "001",
        name: "Basic Protection",
        coverageAmount: 50000.0,
        monthlyPremium: 25.0,
      );

      //! Act
      final result = mapper.fromInsurancePlanDto(dto);

      //! Assert
      expect(result, isA<InsurancePlan>());
      expect(result.id, equals(dto.id));
      expect(result.name, equals(dto.name));
    });

    test('should convert list of InsurancePlanDto to list of InsurancePlan', () {
      //! Arrange
      const dtoList = [
        InsurancePlanDto(
          id: "001",
          name: "Basic Protection",
          coverageAmount: 50000.0,
          monthlyPremium: 25.0,
        ),
        InsurancePlanDto(
          id: "002",
          name: "Standard Protection",
          coverageAmount: 100000.0,
          monthlyPremium: 50.0,
        ),
      ];

      //! Act
      final resultList = mapper.fromDtoList(dtoList);

      //! Assert
      expect(resultList, isA<List<InsurancePlan>>());
      expect(resultList.length, equals(dtoList.length));
      expect(resultList.first.id, equals(dtoList.first.id));
    });
  });

  group('fromInsurancePlanDetailsDto', () {
    test('should convert InsurancePlanDetailsDto to InsurancePlanDetails', () {
      //! Arrange
      const dto = InsurancePlanDetailsDto(
        id: "002",
        name: "Standard Protection",
        coverageAmount: 100000.0,
        monthlyPremium: 50.0,
        deductible: 750.0,
        planDescription: "Extended coverage for fire, theft, and natural disasters.",
        coverageTypes: ["Fire Damage", "Theft", "Natural Disasters"],
        exclusions: ["War-related Damages"],
        claimProcessTime: "10 days",
        maxClaimLimit: 200000.0,
        planDuration: "2 years",
      );

      //! Act
      final result = mapper.fromInsurancePlanDetailsDto(dto);

      //! Assert
      expect(result, isA<InsurancePlanDetails>());
      expect(result.id, equals(dto.id));
      expect(result.name, equals(dto.name));
      expect(result.coverageAmount, equals(dto.coverageAmount));
    });
  });
}
